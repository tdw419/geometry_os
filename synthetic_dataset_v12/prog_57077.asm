; DESCRIPTION: Draws a cyan line from (375, 188) to (101, 233).
; PLAN: r0=375(x1), r1=188(y1), r2=101(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 188
LDI r2, 101
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
