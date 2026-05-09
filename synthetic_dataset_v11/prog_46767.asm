; DESCRIPTION: Renders a orange box of size 91x16 starting at (22, 32).
; PLAN: r0=22(x), r1=32(y), r2=91(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 32
LDI r2, 91
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
