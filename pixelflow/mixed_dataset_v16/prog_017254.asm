; DESCRIPTION: Renders a green box of size 77x56 starting at (161, 68).
; PLAN: r0=161(x), r1=68(y), r2=77(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 68
LDI r2, 77
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
