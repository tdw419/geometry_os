; DESCRIPTION: Renders a green box of size 77x59 starting at (187, 69).
; PLAN: r0=187(x), r1=69(y), r2=77(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 69
LDI r2, 77
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
