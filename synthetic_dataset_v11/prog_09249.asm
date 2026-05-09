; DESCRIPTION: Renders a red box of size 27x71 starting at (119, 66).
; PLAN: r0=119(x), r1=66(y), r2=27(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 66
LDI r2, 27
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
