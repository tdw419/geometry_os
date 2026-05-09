; DESCRIPTION: Renders a orange line between points (298, 238) and (45, 239).
; PLAN: r0=298(x1), r1=238(y1), r2=45(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 238
LDI r2, 45
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
