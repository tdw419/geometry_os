; DESCRIPTION: Renders a red box of size 86x66 starting at (14, 20).
; PLAN: r0=14(x), r1=20(y), r2=86(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 20
LDI r2, 86
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
