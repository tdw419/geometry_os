; DESCRIPTION: Renders a red box of size 67x87 starting at (37, 76).
; PLAN: r0=37(x), r1=76(y), r2=67(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 76
LDI r2, 67
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
