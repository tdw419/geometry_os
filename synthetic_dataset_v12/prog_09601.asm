; DESCRIPTION: Renders a white box of size 65x26 starting at (61, 139).
; PLAN: r0=61(x), r1=139(y), r2=65(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 139
LDI r2, 65
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
