; DESCRIPTION: Renders a red box of size 106x30 starting at (141, 135).
; PLAN: r0=141(x), r1=135(y), r2=106(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 135
LDI r2, 106
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
