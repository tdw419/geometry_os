; DESCRIPTION: Renders a orange box of size 37x112 starting at (464, 87).
; PLAN: r0=464(x), r1=87(y), r2=37(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 87
LDI r2, 37
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
