; DESCRIPTION: Composite: Renders a black box of size 80x82 starting at (25, 112) then Renders a orange disk with center (455, 62) and radius 29 then Places a cyan dot at position (135, 154).
; PLAN: r0=25(x), r1=112(y), r2=80(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=455(x), r6=62(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=135(x), r11=154(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 25
LDI r1, 112
LDI r2, 80
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 62
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 135
LDI r11, 154
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
