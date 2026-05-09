; DESCRIPTION: Renders a green box of size 97x74 starting at (395, 133).
; PLAN: r0=395(x), r1=133(y), r2=97(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 133
LDI r2, 97
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
