; DESCRIPTION: Composite: Places a blue dot at position (430, 9) then Renders a orange box of size 105x59 starting at (300, 57).
; PLAN: r0=430(x), r1=9(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=57(y), r7=105(width), r8=59(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 9
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 300
LDI r6, 57
LDI r7, 105
LDI r8, 59
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
