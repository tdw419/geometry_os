; DESCRIPTION: Renders a red box of size 113x93 starting at (0, 72).
; PLAN: r0=0(x), r1=72(y), r2=113(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 72
LDI r2, 113
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
