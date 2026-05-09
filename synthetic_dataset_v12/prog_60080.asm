; DESCRIPTION: Renders a orange box of size 27x83 starting at (30, 110).
; PLAN: r0=30(x), r1=110(y), r2=27(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 110
LDI r2, 27
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
