; DESCRIPTION: Renders a red box of size 20x96 starting at (50, 55).
; PLAN: r0=50(x), r1=55(y), r2=20(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 55
LDI r2, 20
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
