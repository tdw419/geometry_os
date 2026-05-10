; DESCRIPTION: Renders a orange box of size 12x60 starting at (376, 14).
; PLAN: r0=376(x), r1=14(y), r2=12(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 14
LDI r2, 12
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
