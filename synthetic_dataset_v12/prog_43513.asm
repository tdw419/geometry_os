; DESCRIPTION: Renders a red box of size 56x57 starting at (14, 56).
; PLAN: r0=14(x), r1=56(y), r2=56(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 56
LDI r2, 56
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
