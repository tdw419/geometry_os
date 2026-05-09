; DESCRIPTION: Renders a red box of size 10x76 starting at (363, 104).
; PLAN: r0=363(x), r1=104(y), r2=10(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 104
LDI r2, 10
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
