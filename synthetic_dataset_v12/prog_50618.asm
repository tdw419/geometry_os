; DESCRIPTION: Composite: Creates a green circular shape at (230, 90) with radius 11 then Sets a single red pixel at (67, 234) then Renders a cyan line between points (284, 181) and (75, 106).
; PLAN: r0=230(x), r1=90(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=67(x), r6=234(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=284(x1), r11=181(y1), r12=75(x2), r13=106(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 90
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 67
LDI r6, 234
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 284
LDI r11, 181
LDI r12, 75
LDI r13, 106
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
