; DESCRIPTION: Renders a green box of size 25x17 starting at (403, 130).
; PLAN: r0=403(x), r1=130(y), r2=25(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 130
LDI r2, 25
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
