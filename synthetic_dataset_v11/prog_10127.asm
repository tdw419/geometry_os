; DESCRIPTION: Renders a red box of size 87x66 starting at (70, 116).
; PLAN: r0=70(x), r1=116(y), r2=87(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 116
LDI r2, 87
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
