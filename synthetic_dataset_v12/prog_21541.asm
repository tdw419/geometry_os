; DESCRIPTION: Renders a green box of size 73x46 starting at (91, 45).
; PLAN: r0=91(x), r1=45(y), r2=73(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 45
LDI r2, 73
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
