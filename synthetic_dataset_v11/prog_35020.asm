; DESCRIPTION: Renders a red box of size 50x70 starting at (167, 22).
; PLAN: r0=167(x), r1=22(y), r2=50(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 22
LDI r2, 50
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
