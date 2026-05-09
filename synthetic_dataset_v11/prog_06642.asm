; DESCRIPTION: Renders a red box of size 31x103 starting at (153, 32).
; PLAN: r0=153(x), r1=32(y), r2=31(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 32
LDI r2, 31
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
