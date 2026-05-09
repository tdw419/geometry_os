; DESCRIPTION: Renders a orange box of size 63x63 starting at (57, 66).
; PLAN: r0=57(x), r1=66(y), r2=63(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 66
LDI r2, 63
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
