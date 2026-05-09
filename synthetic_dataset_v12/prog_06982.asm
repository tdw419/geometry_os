; DESCRIPTION: Renders a red box of size 56x106 starting at (173, 3).
; PLAN: r0=173(x), r1=3(y), r2=56(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 3
LDI r2, 56
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
