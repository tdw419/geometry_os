; DESCRIPTION: Renders a yellow box of size 15x23 starting at (438, 162).
; PLAN: r0=438(x), r1=162(y), r2=15(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 162
LDI r2, 15
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
