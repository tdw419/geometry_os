; DESCRIPTION: Renders a red box of size 15x108 starting at (200, 37).
; PLAN: r0=200(x), r1=37(y), r2=15(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 37
LDI r2, 15
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
