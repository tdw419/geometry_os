; DESCRIPTION: Renders a white box of size 96x67 starting at (77, 13).
; PLAN: r0=77(x), r1=13(y), r2=96(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 13
LDI r2, 96
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
