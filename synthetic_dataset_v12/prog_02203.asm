; DESCRIPTION: Renders a green box of size 108x18 starting at (105, 200).
; PLAN: r0=105(x), r1=200(y), r2=108(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 200
LDI r2, 108
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
