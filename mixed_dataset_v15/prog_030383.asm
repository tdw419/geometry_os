; DESCRIPTION: Renders a white box of size 91x77 starting at (153, 135).
; PLAN: r0=153(x), r1=135(y), r2=91(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 135
LDI r2, 91
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
