; DESCRIPTION: Renders a red box of size 85x86 starting at (19, 167).
; PLAN: r0=19(x), r1=167(y), r2=85(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 167
LDI r2, 85
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
