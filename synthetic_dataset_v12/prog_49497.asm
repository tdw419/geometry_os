; DESCRIPTION: Composite: Places a green dot at position (477, 154) then Places a red circle of radius 59 at center (66, 116) then Places a green 13x90 rectangle at position (0, 96).
; PLAN: r0=477(x), r1=154(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=66(x), r6=116(y), r7=59(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=0(x), r11=96(y), r12=13(width), r13=90(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 477
LDI r1, 154
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 66
LDI r6, 116
LDI r7, 59
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 0
LDI r11, 96
LDI r12, 13
LDI r13, 90
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
