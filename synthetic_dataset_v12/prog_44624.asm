; DESCRIPTION: Renders a red box of size 12x13 starting at (92, 206).
; PLAN: r0=92(x), r1=206(y), r2=12(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 206
LDI r2, 12
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
