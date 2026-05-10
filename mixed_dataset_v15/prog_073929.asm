; DESCRIPTION: Composite: Places a orange dot at position (446, 64) then Renders a orange disk with center (78, 159) and radius 10 then Renders a purple line between points (238, 129) and (97, 208).
; PLAN: r0=446(x), r1=64(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=78(x), r6=159(y), r7=10(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=238(x1), r11=129(y1), r12=97(x2), r13=208(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 446
LDI r1, 64
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 78
LDI r6, 159
LDI r7, 10
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 238
LDI r11, 129
LDI r12, 97
LDI r13, 208
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
