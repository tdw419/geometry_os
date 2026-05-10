; DESCRIPTION: Renders a orange box of size 50x48 starting at (12, 100).
; PLAN: r0=12(x), r1=100(y), r2=50(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 100
LDI r2, 50
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
