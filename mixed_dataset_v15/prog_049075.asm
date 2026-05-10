; DESCRIPTION: Renders a red box of size 12x60 starting at (217, 99).
; PLAN: r0=217(x), r1=99(y), r2=12(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 99
LDI r2, 12
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
