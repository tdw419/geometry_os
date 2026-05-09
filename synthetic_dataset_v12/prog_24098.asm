; DESCRIPTION: Renders a red box of size 65x18 starting at (247, 172).
; PLAN: r0=247(x), r1=172(y), r2=65(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 172
LDI r2, 65
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
