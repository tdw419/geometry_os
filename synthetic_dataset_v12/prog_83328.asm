; DESCRIPTION: Renders a orange box of size 33x32 starting at (154, 93).
; PLAN: r0=154(x), r1=93(y), r2=33(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 93
LDI r2, 33
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
