; DESCRIPTION: Renders a orange box of size 63x90 starting at (191, 23).
; PLAN: r0=191(x), r1=23(y), r2=63(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 23
LDI r2, 63
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
