; DESCRIPTION: Renders a red box of size 75x55 starting at (0, 31).
; PLAN: r0=0(x), r1=31(y), r2=75(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 31
LDI r2, 75
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
