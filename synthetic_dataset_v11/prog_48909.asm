; DESCRIPTION: Renders a red box of size 86x19 starting at (68, 9).
; PLAN: r0=68(x), r1=9(y), r2=86(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 9
LDI r2, 86
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
