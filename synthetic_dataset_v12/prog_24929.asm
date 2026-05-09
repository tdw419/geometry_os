; DESCRIPTION: Renders a red box of size 83x84 starting at (32, 98).
; PLAN: r0=32(x), r1=98(y), r2=83(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 98
LDI r2, 83
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
