; DESCRIPTION: Renders a white box of size 83x94 starting at (204, 139).
; PLAN: r0=204(x), r1=139(y), r2=83(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 139
LDI r2, 83
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
