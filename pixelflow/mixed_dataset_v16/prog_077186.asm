; DESCRIPTION: Composite: Renders a cyan box of size 26x68 starting at (226, 151) then Renders a orange disk with center (180, 118) and radius 76 then Places a blue dot at position (284, 140).
; PLAN: r0=226(x), r1=151(y), r2=26(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x), r6=118(y), r7=76(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x), r11=140(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 226
LDI r1, 151
LDI r2, 26
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 118
LDI r7, 76
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 140
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
