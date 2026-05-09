; DESCRIPTION: Composite: Places a black 113x61 rectangle at position (126, 97) then Renders a white disk with center (211, 75) and radius 65.
; PLAN: r0=126(x), r1=97(y), r2=113(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=211(x), r6=75(y), r7=65(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 126
LDI r1, 97
LDI r2, 113
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 75
LDI r7, 65
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
