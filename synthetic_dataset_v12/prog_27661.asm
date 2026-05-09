; DESCRIPTION: Renders a black line between points (475, 203) and (509, 208).
; PLAN: r0=475(x1), r1=203(y1), r2=509(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 203
LDI r2, 509
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
