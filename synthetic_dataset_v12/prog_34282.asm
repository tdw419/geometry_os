; DESCRIPTION: Renders a red box of size 33x87 starting at (88, 107).
; PLAN: r0=88(x), r1=107(y), r2=33(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 107
LDI r2, 33
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
