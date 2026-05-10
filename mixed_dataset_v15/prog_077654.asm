; DESCRIPTION: Composite: Renders a purple disk with center (428, 102) and radius 53 then Places a blue 88x95 rectangle at position (286, 47).
; PLAN: r0=428(x), r1=102(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=286(x), r6=47(y), r7=88(width), r8=95(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 428
LDI r1, 102
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 286
LDI r6, 47
LDI r7, 88
LDI r8, 95
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
