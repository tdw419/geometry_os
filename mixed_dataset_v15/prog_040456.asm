; DESCRIPTION: Composite: Creates a orange circular shape at (301, 125) with radius 41 then Renders a cyan box of size 71x55 starting at (12, 105) then Places a magenta dot at position (67, 248).
; PLAN: r0=301(x), r1=125(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=12(x), r6=105(y), r7=71(width), r8=55(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=67(x), r11=248(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 301
LDI r1, 125
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 12
LDI r6, 105
LDI r7, 71
LDI r8, 55
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 248
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
