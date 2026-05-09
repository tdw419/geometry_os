; DESCRIPTION: Renders a yellow box of size 26x94 starting at (398, 115).
; PLAN: r0=398(x), r1=115(y), r2=26(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 115
LDI r2, 26
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
