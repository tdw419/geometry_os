; DESCRIPTION: Draws a yellow line from (216, 209) to (275, 64).
; PLAN: r0=216(x1), r1=209(y1), r2=275(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 209
LDI r2, 275
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
