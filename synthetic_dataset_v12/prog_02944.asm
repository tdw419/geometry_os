; DESCRIPTION: Renders a green box of size 103x22 starting at (274, 22).
; PLAN: r0=274(x), r1=22(y), r2=103(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 22
LDI r2, 103
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
