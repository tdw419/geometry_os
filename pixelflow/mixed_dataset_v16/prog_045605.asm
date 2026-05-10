; DESCRIPTION: Renders a white box of size 37x53 starting at (90, 12).
; PLAN: r0=90(x), r1=12(y), r2=37(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 12
LDI r2, 37
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
