; DESCRIPTION: Draws a black line from (13, 249) to (188, 213).
; PLAN: r0=13(x1), r1=249(y1), r2=188(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 249
LDI r2, 188
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
