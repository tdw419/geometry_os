; DESCRIPTION: Composite: Places a white 21x23 rectangle at position (371, 231) then Renders a magenta disk with center (66, 104) and radius 64 then Sets a single black pixel at (356, 8).
; PLAN: r0=371(x), r1=231(y), r2=21(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x), r6=104(y), r7=64(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=356(x), r11=8(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 371
LDI r1, 231
LDI r2, 21
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 104
LDI r7, 64
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 356
LDI r11, 8
LDI r12, 0x000000
PSET r10, r11, r12
HALT
