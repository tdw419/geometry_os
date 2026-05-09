; DESCRIPTION: Draws a magenta line from (108, 77) to (242, 52).
; PLAN: r0=108(x1), r1=77(y1), r2=242(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 77
LDI r2, 242
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
