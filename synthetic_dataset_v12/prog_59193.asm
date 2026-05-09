; DESCRIPTION: Draws a blue line from (242, 172) to (301, 56).
; PLAN: r0=242(x1), r1=172(y1), r2=301(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 172
LDI r2, 301
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
