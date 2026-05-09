; DESCRIPTION: Draws a cyan line from (25, 8) to (20, 221).
; PLAN: r0=25(x1), r1=8(y1), r2=20(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 8
LDI r2, 20
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
