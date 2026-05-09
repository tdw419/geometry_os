; DESCRIPTION: Renders a green box of size 12x91 starting at (486, 162).
; PLAN: r0=486(x), r1=162(y), r2=12(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 162
LDI r2, 12
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
