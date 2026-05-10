; DESCRIPTION: Renders a red box of size 43x117 starting at (221, 11).
; PLAN: r0=221(x), r1=11(y), r2=43(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 11
LDI r2, 43
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
