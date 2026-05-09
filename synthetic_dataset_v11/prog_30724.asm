; DESCRIPTION: Renders a green box of size 89x26 starting at (80, 135).
; PLAN: r0=80(x), r1=135(y), r2=89(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 135
LDI r2, 89
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
