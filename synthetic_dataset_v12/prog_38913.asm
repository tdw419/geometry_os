; DESCRIPTION: Composite: Renders a red disk with center (143, 74) and radius 70 then Renders a orange box of size 111x94 starting at (52, 147) then Sets a single magenta pixel at (255, 116).
; PLAN: r0=143(x), r1=74(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=52(x), r6=147(y), r7=111(width), r8=94(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=255(x), r11=116(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 143
LDI r1, 74
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 52
LDI r6, 147
LDI r7, 111
LDI r8, 94
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 116
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
