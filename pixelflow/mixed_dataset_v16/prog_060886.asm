; DESCRIPTION: Renders a orange box of size 94x10 starting at (270, 29).
; PLAN: r0=270(x), r1=29(y), r2=94(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 29
LDI r2, 94
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
