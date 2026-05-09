; DESCRIPTION: Renders a green box of size 53x94 starting at (174, 77).
; PLAN: r0=174(x), r1=77(y), r2=53(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 77
LDI r2, 53
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
