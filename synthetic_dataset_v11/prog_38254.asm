; DESCRIPTION: Composite: . Then Places a blue dot at position (181, 90). Then Renders a orange box of size 11x14 starting at (162, 21).
; PLAN: r0=181(x), r1=90(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=162(x), r1=21(y), r2=11(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (181, 90).
; PLAN: r0=181(x), r1=90(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 90
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a orange box of size 11x14 starting at (162, 21).
; PLAN: r0=162(x), r1=21(y), r2=11(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 21
LDI r2, 11
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
