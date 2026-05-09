; DESCRIPTION: Composite: Renders a green box of size 116x115 starting at (222, 141) then Places a black circle of radius 14 at center (489, 93) then Places a cyan dot at position (30, 113).
; PLAN: r0=222(x), r1=141(y), r2=116(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=489(x), r6=93(y), r7=14(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=30(x), r11=113(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 222
LDI r1, 141
LDI r2, 116
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 93
LDI r7, 14
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 30
LDI r11, 113
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
