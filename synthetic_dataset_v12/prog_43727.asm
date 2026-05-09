; DESCRIPTION: Renders a green box of size 100x113 starting at (188, 3).
; PLAN: r0=188(x), r1=3(y), r2=100(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 3
LDI r2, 100
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
