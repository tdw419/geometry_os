; DESCRIPTION: Draws a yellow line from (228, 209) to (388, 209).
; PLAN: r0=228(x1), r1=209(y1), r2=388(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 209
LDI r2, 388
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
