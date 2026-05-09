; DESCRIPTION: Composite: Draws a red rectangle at (42, 144) with width 95 and height 48 then Places a cyan circle of radius 67 at center (287, 152) then Places a magenta dot at position (214, 20).
; PLAN: r0=42(x), r1=144(y), r2=95(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=287(x), r6=152(y), r7=67(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=214(x), r11=20(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 42
LDI r1, 144
LDI r2, 95
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 152
LDI r7, 67
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 214
LDI r11, 20
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
