; DESCRIPTION: Renders a red box of size 34x15 starting at (402, 46).
; PLAN: r0=402(x), r1=46(y), r2=34(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 46
LDI r2, 34
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
