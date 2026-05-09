; DESCRIPTION: Draws a yellow line from (265, 137) to (291, 113).
; PLAN: r0=265(x1), r1=137(y1), r2=291(x2), r3=113(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 137
LDI r2, 291
LDI r3, 113
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
