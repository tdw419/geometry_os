; DESCRIPTION: Renders a black box of size 22x88 starting at (422, 46).
; PLAN: r0=422(x), r1=46(y), r2=22(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 46
LDI r2, 22
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
