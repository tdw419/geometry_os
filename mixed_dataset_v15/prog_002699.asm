; DESCRIPTION: Composite: Places a purple 67x54 rectangle at position (117, 58) then Renders a black disk with center (464, 182) and radius 37.
; PLAN: r0=117(x), r1=58(y), r2=67(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=464(x), r6=182(y), r7=37(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 117
LDI r1, 58
LDI r2, 67
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 182
LDI r7, 37
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
