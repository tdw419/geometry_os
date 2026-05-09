; DESCRIPTION: Renders a orange box of size 66x85 starting at (204, 168).
; PLAN: r0=204(x), r1=168(y), r2=66(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 168
LDI r2, 66
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
