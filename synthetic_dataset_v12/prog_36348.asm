; DESCRIPTION: Renders a red box of size 83x63 starting at (256, 15).
; PLAN: r0=256(x), r1=15(y), r2=83(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 15
LDI r2, 83
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
