; DESCRIPTION: Renders a green box of size 102x46 starting at (69, 66).
; PLAN: r0=69(x), r1=66(y), r2=102(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 66
LDI r2, 102
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
