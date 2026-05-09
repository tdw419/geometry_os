; DESCRIPTION: Composite: Sets a single purple pixel at (379, 239) then Renders a blue disk with center (263, 106) and radius 31 then Places a green 83x32 rectangle at position (209, 47).
; PLAN: r0=379(x), r1=239(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=263(x), r6=106(y), r7=31(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=209(x), r11=47(y), r12=83(width), r13=32(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 379
LDI r1, 239
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 263
LDI r6, 106
LDI r7, 31
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 209
LDI r11, 47
LDI r12, 83
LDI r13, 32
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
