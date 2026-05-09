; DESCRIPTION: Renders a blue box of size 10x77 starting at (116, 38).
; PLAN: r0=116(x), r1=38(y), r2=10(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 38
LDI r2, 10
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
