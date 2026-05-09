; DESCRIPTION: Composite: Renders a red disk with center (150, 116) and radius 30 then Sets a single red pixel at (21, 213) then Draws a orange line from (356, 10) to (283, 30).
; PLAN: r0=150(x), r1=116(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=21(x), r6=213(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=356(x1), r11=10(y1), r12=283(x2), r13=30(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 116
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 21
LDI r6, 213
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 356
LDI r11, 10
LDI r12, 283
LDI r13, 30
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
