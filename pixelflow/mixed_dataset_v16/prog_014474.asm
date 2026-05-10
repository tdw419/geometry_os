; DESCRIPTION: Renders a red box of size 63x95 starting at (351, 59).
; PLAN: r0=351(x), r1=59(y), r2=63(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 59
LDI r2, 63
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
