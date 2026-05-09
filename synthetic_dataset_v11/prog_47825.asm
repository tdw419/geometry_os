; DESCRIPTION: Renders a white box of size 12x90 starting at (240, 102).
; PLAN: r0=240(x), r1=102(y), r2=12(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 102
LDI r2, 12
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
