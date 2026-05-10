; DESCRIPTION: Composite: Renders a magenta disk with center (202, 142) and radius 76 then Renders a green box of size 105x81 starting at (5, 11) then Places a magenta dot at position (263, 0).
; PLAN: r0=202(x), r1=142(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=5(x), r6=11(y), r7=105(width), r8=81(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=263(x), r11=0(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 202
LDI r1, 142
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 5
LDI r6, 11
LDI r7, 105
LDI r8, 81
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 0
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
