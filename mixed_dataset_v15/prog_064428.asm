; DESCRIPTION: Composite: Places a cyan circle of radius 66 at center (181, 184) then Renders a orange box of size 47x25 starting at (49, 127).
; PLAN: r0=181(x), r1=184(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=127(y), r7=47(width), r8=25(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 181
LDI r1, 184
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 127
LDI r7, 47
LDI r8, 25
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
