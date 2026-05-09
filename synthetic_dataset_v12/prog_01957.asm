; DESCRIPTION: Renders a red box of size 71x48 starting at (381, 185).
; PLAN: r0=381(x), r1=185(y), r2=71(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 185
LDI r2, 71
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
