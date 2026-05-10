; DESCRIPTION: Composite: Places a white 34x90 rectangle at position (133, 54) then Places a black circle of radius 59 at center (71, 155).
; PLAN: r0=133(x), r1=54(y), r2=34(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=71(x), r6=155(y), r7=59(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 54
LDI r2, 34
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 155
LDI r7, 59
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
