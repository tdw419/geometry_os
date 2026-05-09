; DESCRIPTION: Renders a white box of size 103x102 starting at (37, 77).
; PLAN: r0=37(x), r1=77(y), r2=103(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 77
LDI r2, 103
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
