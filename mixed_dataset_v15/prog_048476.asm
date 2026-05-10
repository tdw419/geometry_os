; DESCRIPTION: Renders a red box of size 118x120 starting at (184, 112).
; PLAN: r0=184(x), r1=112(y), r2=118(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 112
LDI r2, 118
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
