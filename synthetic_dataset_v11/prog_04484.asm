; DESCRIPTION: Renders a black box of size 40x70 starting at (24, 152).
; PLAN: r0=24(x), r1=152(y), r2=40(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 152
LDI r2, 40
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
