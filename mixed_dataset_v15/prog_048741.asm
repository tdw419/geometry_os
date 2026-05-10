; DESCRIPTION: Composite: Places a white dot at position (402, 73) then Renders a cyan box of size 69x112 starting at (242, 119) then Creates a red circular shape at (387, 62) with radius 43.
; PLAN: r0=402(x), r1=73(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=242(x), r6=119(y), r7=69(width), r8=112(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=387(x), r11=62(y), r12=43(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 402
LDI r1, 73
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 242
LDI r6, 119
LDI r7, 69
LDI r8, 112
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 387
LDI r11, 62
LDI r12, 43
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
