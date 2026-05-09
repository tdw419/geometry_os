; DESCRIPTION: Composite: Places a blue 61x100 rectangle at position (5, 94) then Renders a magenta disk with center (200, 118) and radius 36 then Places a red dot at position (205, 137).
; PLAN: r0=5(x), r1=94(y), r2=61(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x), r6=118(y), r7=36(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=205(x), r11=137(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 5
LDI r1, 94
LDI r2, 61
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 118
LDI r7, 36
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 205
LDI r11, 137
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
