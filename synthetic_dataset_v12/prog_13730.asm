; DESCRIPTION: Renders a yellow box of size 62x90 starting at (370, 89).
; PLAN: r0=370(x), r1=89(y), r2=62(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 89
LDI r2, 62
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
