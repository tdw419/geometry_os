; DESCRIPTION: Renders a white box of size 11x71 starting at (242, 115).
; PLAN: r0=242(x), r1=115(y), r2=11(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 115
LDI r2, 11
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
