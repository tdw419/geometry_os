; DESCRIPTION: Renders a orange box of size 32x85 starting at (59, 133).
; PLAN: r0=59(x), r1=133(y), r2=32(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 133
LDI r2, 32
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
