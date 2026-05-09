; DESCRIPTION: Renders a green box of size 54x83 starting at (67, 141).
; PLAN: r0=67(x), r1=141(y), r2=54(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 141
LDI r2, 54
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
