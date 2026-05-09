; DESCRIPTION: Renders a red box of size 118x12 starting at (214, 19).
; PLAN: r0=214(x), r1=19(y), r2=118(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 19
LDI r2, 118
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
