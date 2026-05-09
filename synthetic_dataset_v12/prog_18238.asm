; DESCRIPTION: Renders a red box of size 70x19 starting at (212, 17).
; PLAN: r0=212(x), r1=17(y), r2=70(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 17
LDI r2, 70
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
