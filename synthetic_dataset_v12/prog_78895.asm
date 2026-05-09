; DESCRIPTION: Composite: Places a blue dot at position (330, 62) then Renders a cyan disk with center (48, 48) and radius 41 then Renders a purple line between points (182, 92) and (23, 178).
; PLAN: r0=330(x), r1=62(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=48(x), r6=48(y), r7=41(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=182(x1), r11=92(y1), r12=23(x2), r13=178(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 330
LDI r1, 62
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 48
LDI r6, 48
LDI r7, 41
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 182
LDI r11, 92
LDI r12, 23
LDI r13, 178
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
