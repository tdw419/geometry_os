; DESCRIPTION: Renders a red box of size 37x75 starting at (111, 10).
; PLAN: r0=111(x), r1=10(y), r2=37(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 10
LDI r2, 37
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
