; DESCRIPTION: Renders a green box of size 98x14 starting at (14, 83).
; PLAN: r0=14(x), r1=83(y), r2=98(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 83
LDI r2, 98
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
