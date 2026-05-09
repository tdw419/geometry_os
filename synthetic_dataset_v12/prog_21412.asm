; DESCRIPTION: Composite: Places a black 88x117 rectangle at position (4, 80) then Places a black circle of radius 37 at center (445, 170).
; PLAN: r0=4(x), r1=80(y), r2=88(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x), r6=170(y), r7=37(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 4
LDI r1, 80
LDI r2, 88
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 170
LDI r7, 37
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
