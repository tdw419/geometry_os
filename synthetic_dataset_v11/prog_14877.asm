; DESCRIPTION: Draws a black line from (134, 174) to (0, 213).
; PLAN: r0=134(x1), r1=174(y1), r2=0(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 174
LDI r2, 0
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
