; DESCRIPTION: Renders a red box of size 13x109 starting at (84, 60).
; PLAN: r0=84(x), r1=60(y), r2=13(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 60
LDI r2, 13
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
