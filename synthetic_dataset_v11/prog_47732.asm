; DESCRIPTION: Draws a yellow line from (27, 209) to (21, 249).
; PLAN: r0=27(x1), r1=209(y1), r2=21(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 209
LDI r2, 21
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
