; DESCRIPTION: Renders a green box of size 29x46 starting at (174, 73).
; PLAN: r0=174(x), r1=73(y), r2=29(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 73
LDI r2, 29
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
