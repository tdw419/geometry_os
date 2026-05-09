; DESCRIPTION: Composite: Places a cyan dot at position (334, 42) then Renders a magenta disk with center (392, 110) and radius 32 then Places a red 15x57 rectangle at position (339, 125).
; PLAN: r0=334(x), r1=42(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=392(x), r6=110(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=339(x), r11=125(y), r12=15(width), r13=57(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 334
LDI r1, 42
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 392
LDI r6, 110
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 339
LDI r11, 125
LDI r12, 15
LDI r13, 57
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
