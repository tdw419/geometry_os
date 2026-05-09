; DESCRIPTION: Renders a orange box of size 20x72 starting at (37, 168).
; PLAN: r0=37(x), r1=168(y), r2=20(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 168
LDI r2, 20
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
