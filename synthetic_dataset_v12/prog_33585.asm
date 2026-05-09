; DESCRIPTION: Renders a red box of size 102x93 starting at (349, 156).
; PLAN: r0=349(x), r1=156(y), r2=102(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 156
LDI r2, 102
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
