; DESCRIPTION: Renders a green box of size 67x81 starting at (299, 77).
; PLAN: r0=299(x), r1=77(y), r2=67(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 77
LDI r2, 67
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
