; DESCRIPTION: Renders a white box of size 66x77 starting at (116, 166).
; PLAN: r0=116(x), r1=166(y), r2=66(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 166
LDI r2, 66
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
