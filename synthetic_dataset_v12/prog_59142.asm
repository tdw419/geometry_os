; DESCRIPTION: Composite: Places a cyan 117x66 rectangle at position (285, 74) then Renders a blue disk with center (38, 194) and radius 17 then Sets a single blue pixel at (52, 221).
; PLAN: r0=285(x), r1=74(y), r2=117(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=38(x), r6=194(y), r7=17(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=52(x), r11=221(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 285
LDI r1, 74
LDI r2, 117
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 194
LDI r7, 17
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 52
LDI r11, 221
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
