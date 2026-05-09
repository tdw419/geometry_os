; DESCRIPTION: Renders a white box of size 60x53 starting at (144, 190).
; PLAN: r0=144(x), r1=190(y), r2=60(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 190
LDI r2, 60
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
