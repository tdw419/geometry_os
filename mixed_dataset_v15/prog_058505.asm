; DESCRIPTION: Draws a yellow line from (27, 250) to (209, 132).
; PLAN: r0=27(x1), r1=250(y1), r2=209(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 250
LDI r2, 209
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
