; DESCRIPTION: Renders a orange box of size 99x83 starting at (72, 89).
; PLAN: r0=72(x), r1=89(y), r2=99(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 89
LDI r2, 99
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
