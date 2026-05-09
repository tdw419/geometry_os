; DESCRIPTION: Renders a green box of size 77x82 starting at (189, 135).
; PLAN: r0=189(x), r1=135(y), r2=77(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 135
LDI r2, 77
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
