; DESCRIPTION: Renders a orange box of size 20x64 starting at (222, 40).
; PLAN: r0=222(x), r1=40(y), r2=20(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 40
LDI r2, 20
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
