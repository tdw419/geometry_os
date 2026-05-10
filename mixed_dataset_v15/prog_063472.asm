; DESCRIPTION: Renders a orange line between points (4, 41) and (288, 213).
; PLAN: r0=4(x1), r1=41(y1), r2=288(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 41
LDI r2, 288
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
