; DESCRIPTION: Renders a red box of size 74x27 starting at (190, 27).
; PLAN: r0=190(x), r1=27(y), r2=74(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 27
LDI r2, 74
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
