; DESCRIPTION: Renders a green box of size 83x19 starting at (259, 162).
; PLAN: r0=259(x), r1=162(y), r2=83(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 162
LDI r2, 83
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
