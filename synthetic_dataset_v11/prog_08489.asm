; DESCRIPTION: Renders a orange box of size 59x44 starting at (133, 45).
; PLAN: r0=133(x), r1=45(y), r2=59(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 45
LDI r2, 59
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
