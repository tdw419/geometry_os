; DESCRIPTION: Renders a yellow box of size 80x83 starting at (343, 139).
; PLAN: r0=343(x), r1=139(y), r2=80(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 139
LDI r2, 80
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
