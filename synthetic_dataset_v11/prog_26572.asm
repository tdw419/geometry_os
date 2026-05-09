; DESCRIPTION: Draws a purple line from (242, 96) to (46, 148).
; PLAN: r0=242(x1), r1=96(y1), r2=46(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 96
LDI r2, 46
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
