; DESCRIPTION: Renders a red box of size 104x72 starting at (359, 81).
; PLAN: r0=359(x), r1=81(y), r2=104(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 81
LDI r2, 104
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
