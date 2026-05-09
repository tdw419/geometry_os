; DESCRIPTION: Renders a green box of size 80x96 starting at (398, 76).
; PLAN: r0=398(x), r1=76(y), r2=80(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 76
LDI r2, 80
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
