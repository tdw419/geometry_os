; DESCRIPTION: Renders a white box of size 93x102 starting at (418, 17).
; PLAN: r0=418(x), r1=17(y), r2=93(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 17
LDI r2, 93
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
