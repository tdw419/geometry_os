; DESCRIPTION: Renders a orange box of size 16x77 starting at (462, 108).
; PLAN: r0=462(x), r1=108(y), r2=16(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 108
LDI r2, 16
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
