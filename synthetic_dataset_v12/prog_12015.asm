; DESCRIPTION: Renders a orange box of size 55x105 starting at (32, 21).
; PLAN: r0=32(x), r1=21(y), r2=55(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 21
LDI r2, 55
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
