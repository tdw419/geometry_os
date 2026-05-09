; DESCRIPTION: Renders a red box of size 104x88 starting at (3, 37).
; PLAN: r0=3(x), r1=37(y), r2=104(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 37
LDI r2, 104
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
