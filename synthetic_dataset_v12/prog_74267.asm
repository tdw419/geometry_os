; DESCRIPTION: Renders a white box of size 85x34 starting at (135, 139).
; PLAN: r0=135(x), r1=139(y), r2=85(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 139
LDI r2, 85
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
