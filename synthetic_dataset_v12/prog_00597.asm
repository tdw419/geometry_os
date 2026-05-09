; DESCRIPTION: Draws a green line from (312, 152) to (455, 213).
; PLAN: r0=312(x1), r1=152(y1), r2=455(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 152
LDI r2, 455
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
