; DESCRIPTION: Renders a black line between points (410, 229) and (199, 203).
; PLAN: r0=410(x1), r1=229(y1), r2=199(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 229
LDI r2, 199
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
