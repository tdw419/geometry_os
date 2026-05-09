; DESCRIPTION: Renders a red box of size 64x99 starting at (44, 89).
; PLAN: r0=44(x), r1=89(y), r2=64(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 89
LDI r2, 64
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
