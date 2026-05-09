; DESCRIPTION: Renders a orange line between points (112, 236) and (23, 213).
; PLAN: r0=112(x1), r1=236(y1), r2=23(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 236
LDI r2, 23
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
