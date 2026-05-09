; DESCRIPTION: Renders a red box of size 111x60 starting at (134, 85).
; PLAN: r0=134(x), r1=85(y), r2=111(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 85
LDI r2, 111
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
