; DESCRIPTION: Draws a blue line from (242, 96) to (144, 138).
; PLAN: r0=242(x1), r1=96(y1), r2=144(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 96
LDI r2, 144
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
