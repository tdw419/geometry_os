; DESCRIPTION: Composite: Draws a black line from (224, 113) to (259, 151) then Sets a single green pixel at (485, 2).
; PLAN: r0=224(x1), r1=113(y1), r2=259(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=485(x), r6=2(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 224
LDI r1, 113
LDI r2, 259
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 2
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
