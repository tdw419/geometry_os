; DESCRIPTION: Renders a red box of size 87x111 starting at (244, 34).
; PLAN: r0=244(x), r1=34(y), r2=87(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 34
LDI r2, 87
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
