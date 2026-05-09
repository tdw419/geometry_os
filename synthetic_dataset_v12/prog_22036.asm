; DESCRIPTION: Renders a red box of size 50x78 starting at (325, 109).
; PLAN: r0=325(x), r1=109(y), r2=50(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 109
LDI r2, 50
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
