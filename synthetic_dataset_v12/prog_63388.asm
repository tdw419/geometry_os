; DESCRIPTION: Renders a red box of size 72x97 starting at (67, 89).
; PLAN: r0=67(x), r1=89(y), r2=72(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 89
LDI r2, 72
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
