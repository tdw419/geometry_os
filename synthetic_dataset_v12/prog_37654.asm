; DESCRIPTION: Renders a orange box of size 56x12 starting at (376, 171).
; PLAN: r0=376(x), r1=171(y), r2=56(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 171
LDI r2, 56
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
