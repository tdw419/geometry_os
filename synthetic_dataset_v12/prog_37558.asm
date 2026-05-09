; DESCRIPTION: Renders a red box of size 97x103 starting at (131, 100).
; PLAN: r0=131(x), r1=100(y), r2=97(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 100
LDI r2, 97
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
