; DESCRIPTION: Renders a red box of size 84x54 starting at (1, 30).
; PLAN: r0=1(x), r1=30(y), r2=84(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 30
LDI r2, 84
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
