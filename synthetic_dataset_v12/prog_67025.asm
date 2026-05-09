; DESCRIPTION: Renders a red box of size 22x120 starting at (444, 67).
; PLAN: r0=444(x), r1=67(y), r2=22(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 67
LDI r2, 22
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
