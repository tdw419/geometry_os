; DESCRIPTION: Composite: Places a black 43x81 rectangle at position (7, 162) then Renders a purple disk with center (80, 19) and radius 13.
; PLAN: r0=7(x), r1=162(y), r2=43(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=80(x), r6=19(y), r7=13(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 7
LDI r1, 162
LDI r2, 43
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 19
LDI r7, 13
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
