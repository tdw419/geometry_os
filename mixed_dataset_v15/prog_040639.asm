; DESCRIPTION: Renders a orange box of size 68x55 starting at (39, 64).
; PLAN: r0=39(x), r1=64(y), r2=68(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 64
LDI r2, 68
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
