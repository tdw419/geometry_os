; DESCRIPTION: Composite: Sets a single white pixel at (294, 177) then Creates a cyan circular shape at (168, 187) with radius 56 then Draws a blue rectangle at (425, 51) with width 86 and height 60.
; PLAN: r0=294(x), r1=177(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=168(x), r6=187(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=425(x), r11=51(y), r12=86(width), r13=60(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 177
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 168
LDI r6, 187
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 425
LDI r11, 51
LDI r12, 86
LDI r13, 60
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
