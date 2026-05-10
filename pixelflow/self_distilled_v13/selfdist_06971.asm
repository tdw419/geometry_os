; DESCRIPTION: Renders a red rectangular region spanning 88 by 10 at (249, 134).
; PLAN: r0=249(x), r1=134(y), r2=88(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 134
LDI r2, 88
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
