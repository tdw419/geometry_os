; DESCRIPTION: Renders a red box of size 68x64 starting at (134, 139).
; PLAN: r0=134(x), r1=139(y), r2=68(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 139
LDI r2, 68
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
