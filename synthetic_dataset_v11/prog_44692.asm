; DESCRIPTION: Renders a orange box of size 16x22 starting at (103, 85).
; PLAN: r0=103(x), r1=85(y), r2=16(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 85
LDI r2, 16
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
