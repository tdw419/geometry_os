; DESCRIPTION: Renders a red box of size 13x63 starting at (113, 78).
; PLAN: r0=113(x), r1=78(y), r2=13(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 78
LDI r2, 13
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
