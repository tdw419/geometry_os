; DESCRIPTION: Renders a red box of size 52x73 starting at (144, 104).
; PLAN: r0=144(x), r1=104(y), r2=52(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 104
LDI r2, 52
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
