; DESCRIPTION: Renders a red box of size 14x84 starting at (199, 24).
; PLAN: r0=199(x), r1=24(y), r2=14(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 24
LDI r2, 14
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
