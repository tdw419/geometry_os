; DESCRIPTION: Draws a green line from (135, 54) to (279, 62).
; PLAN: r0=135(x1), r1=54(y1), r2=279(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 54
LDI r2, 279
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
