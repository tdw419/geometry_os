; DESCRIPTION: Draws a cyan line from (50, 33) to (184, 215).
; PLAN: r0=50(x1), r1=33(y1), r2=184(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 33
LDI r2, 184
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
