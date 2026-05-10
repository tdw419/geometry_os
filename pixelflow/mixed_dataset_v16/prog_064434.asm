; DESCRIPTION: Composite: Renders a purple disk with center (92, 151) and radius 79 then Places a purple 22x45 rectangle at position (141, 209) then Sets a single blue pixel at (307, 166).
; PLAN: r0=92(x), r1=151(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x), r6=209(y), r7=22(width), r8=45(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=307(x), r11=166(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 92
LDI r1, 151
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 209
LDI r7, 22
LDI r8, 45
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 307
LDI r11, 166
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
