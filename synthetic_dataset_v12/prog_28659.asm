; DESCRIPTION: Renders a red box of size 59x10 starting at (20, 37).
; PLAN: r0=20(x), r1=37(y), r2=59(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 37
LDI r2, 59
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
