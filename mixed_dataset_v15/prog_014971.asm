; DESCRIPTION: Renders a white box of size 39x77 starting at (359, 177).
; PLAN: r0=359(x), r1=177(y), r2=39(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 177
LDI r2, 39
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
