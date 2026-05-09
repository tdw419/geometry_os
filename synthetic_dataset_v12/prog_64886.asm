; DESCRIPTION: Renders a white box of size 57x37 starting at (171, 139).
; PLAN: r0=171(x), r1=139(y), r2=57(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 139
LDI r2, 57
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
