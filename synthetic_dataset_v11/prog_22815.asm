; DESCRIPTION: Renders a orange box of size 110x55 starting at (46, 115).
; PLAN: r0=46(x), r1=115(y), r2=110(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 115
LDI r2, 110
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
