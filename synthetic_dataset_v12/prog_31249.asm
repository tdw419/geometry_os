; DESCRIPTION: Renders a red box of size 60x100 starting at (238, 139).
; PLAN: r0=238(x), r1=139(y), r2=60(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 139
LDI r2, 60
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
