; DESCRIPTION: Renders a red box of size 74x93 starting at (125, 87).
; PLAN: r0=125(x), r1=87(y), r2=74(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 87
LDI r2, 74
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
