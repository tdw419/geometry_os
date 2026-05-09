; DESCRIPTION: Renders a white box of size 111x44 starting at (131, 43).
; PLAN: r0=131(x), r1=43(y), r2=111(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 43
LDI r2, 111
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
