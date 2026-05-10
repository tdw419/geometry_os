; DESCRIPTION: Renders a orange box of size 30x103 starting at (388, 105).
; PLAN: r0=388(x), r1=105(y), r2=30(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 105
LDI r2, 30
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
