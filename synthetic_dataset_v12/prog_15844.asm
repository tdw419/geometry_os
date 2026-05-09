; DESCRIPTION: Composite: Creates a cyan circular shape at (157, 87) with radius 71 then Places a white 115x107 rectangle at position (284, 28) then Sets a single magenta pixel at (356, 93).
; PLAN: r0=157(x), r1=87(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x), r6=28(y), r7=115(width), r8=107(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=356(x), r11=93(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 157
LDI r1, 87
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 28
LDI r7, 115
LDI r8, 107
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 93
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
