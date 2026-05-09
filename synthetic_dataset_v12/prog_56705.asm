; DESCRIPTION: Renders a green box of size 77x107 starting at (121, 135).
; PLAN: r0=121(x), r1=135(y), r2=77(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 135
LDI r2, 77
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
