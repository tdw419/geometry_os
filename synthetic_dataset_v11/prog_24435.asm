; DESCRIPTION: Renders a orange box of size 64x100 starting at (152, 58).
; PLAN: r0=152(x), r1=58(y), r2=64(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 58
LDI r2, 64
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
