; DESCRIPTION: Renders a red box of size 19x50 starting at (80, 160).
; PLAN: r0=80(x), r1=160(y), r2=19(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 160
LDI r2, 19
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
