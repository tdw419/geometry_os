; DESCRIPTION: Renders a red box of size 82x55 starting at (407, 5).
; PLAN: r0=407(x), r1=5(y), r2=82(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 5
LDI r2, 82
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
