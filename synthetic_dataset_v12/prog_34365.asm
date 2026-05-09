; DESCRIPTION: Renders a red box of size 48x31 starting at (232, 83).
; PLAN: r0=232(x), r1=83(y), r2=48(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 83
LDI r2, 48
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
