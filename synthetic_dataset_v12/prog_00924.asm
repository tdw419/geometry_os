; DESCRIPTION: Renders a orange box of size 60x77 starting at (212, 24).
; PLAN: r0=212(x), r1=24(y), r2=60(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 24
LDI r2, 60
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
