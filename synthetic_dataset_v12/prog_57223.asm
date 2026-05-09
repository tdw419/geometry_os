; DESCRIPTION: Composite: Places a red circle of radius 37 at center (303, 116) then Places a green 106x88 rectangle at position (391, 43).
; PLAN: r0=303(x), r1=116(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x), r6=43(y), r7=106(width), r8=88(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 116
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 43
LDI r7, 106
LDI r8, 88
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
