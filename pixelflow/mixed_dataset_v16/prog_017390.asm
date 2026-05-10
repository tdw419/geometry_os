; DESCRIPTION: Renders a white box of size 111x57 starting at (153, 3).
; PLAN: r0=153(x), r1=3(y), r2=111(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 3
LDI r2, 111
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
