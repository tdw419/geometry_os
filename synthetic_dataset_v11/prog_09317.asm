; DESCRIPTION: Renders a red box of size 17x87 starting at (213, 9).
; PLAN: r0=213(x), r1=9(y), r2=17(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 9
LDI r2, 17
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
