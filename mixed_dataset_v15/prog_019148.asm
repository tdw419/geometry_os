; DESCRIPTION: Renders a black box of size 91x60 starting at (260, 40).
; PLAN: r0=260(x), r1=40(y), r2=91(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 40
LDI r2, 91
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
