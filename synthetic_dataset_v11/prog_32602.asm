; DESCRIPTION: Renders a white box of size 17x26 starting at (202, 115).
; PLAN: r0=202(x), r1=115(y), r2=17(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 115
LDI r2, 17
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
