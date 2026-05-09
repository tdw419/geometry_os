; DESCRIPTION: Renders a orange box of size 60x30 starting at (429, 1).
; PLAN: r0=429(x), r1=1(y), r2=60(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 1
LDI r2, 60
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
