; DESCRIPTION: Renders a red box of size 19x85 starting at (25, 160).
; PLAN: r0=25(x), r1=160(y), r2=19(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 160
LDI r2, 19
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
