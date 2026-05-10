; DESCRIPTION: Composite: Sets a single magenta pixel at (221, 61) then Draws a cyan rectangle at (224, 32) with width 18 and height 64 then Places a white circle of radius 17 at center (367, 209).
; PLAN: r0=221(x), r1=61(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=224(x), r6=32(y), r7=18(width), r8=64(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=367(x), r11=209(y), r12=17(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 221
LDI r1, 61
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 224
LDI r6, 32
LDI r7, 18
LDI r8, 64
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 209
LDI r12, 17
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
