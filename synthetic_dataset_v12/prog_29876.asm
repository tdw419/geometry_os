; DESCRIPTION: Composite: Renders a cyan line between points (183, 7) and (283, 56) then Places a yellow dot at position (335, 204) then Renders a yellow box of size 74x24 starting at (253, 121).
; PLAN: r0=183(x1), r1=7(y1), r2=283(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=335(x), r6=204(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=253(x), r11=121(y), r12=74(width), r13=24(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 7
LDI r2, 283
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 204
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 253
LDI r11, 121
LDI r12, 74
LDI r13, 24
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
