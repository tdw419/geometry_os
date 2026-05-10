; DESCRIPTION: Composite: Renders a blue box of size 94x90 starting at (303, 114) then Places a white circle of radius 75 at center (436, 127).
; PLAN: r0=303(x), r1=114(y), r2=94(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x), r6=127(y), r7=75(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 303
LDI r1, 114
LDI r2, 94
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 127
LDI r7, 75
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
