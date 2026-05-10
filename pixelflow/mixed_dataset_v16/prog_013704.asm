; DESCRIPTION: Renders a orange box of size 94x63 starting at (261, 10).
; PLAN: r0=261(x), r1=10(y), r2=94(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 10
LDI r2, 94
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
