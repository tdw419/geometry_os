; DESCRIPTION: Renders a black line between points (193, 116) and (499, 38).
; PLAN: r0=193(x1), r1=116(y1), r2=499(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 116
LDI r2, 499
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
