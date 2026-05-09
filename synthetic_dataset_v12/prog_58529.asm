; DESCRIPTION: Draws a cyan line from (50, 221) to (222, 215).
; PLAN: r0=50(x1), r1=221(y1), r2=222(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 221
LDI r2, 222
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
