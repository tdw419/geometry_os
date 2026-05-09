; DESCRIPTION: Renders a red box of size 102x22 starting at (50, 15).
; PLAN: r0=50(x), r1=15(y), r2=102(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 15
LDI r2, 102
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
