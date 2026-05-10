; DESCRIPTION: Renders a black line between points (335, 41) and (499, 210).
; PLAN: r0=335(x1), r1=41(y1), r2=499(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 41
LDI r2, 499
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
