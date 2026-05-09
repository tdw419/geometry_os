; DESCRIPTION: Renders a green box of size 111x58 starting at (208, 140).
; PLAN: r0=208(x), r1=140(y), r2=111(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 140
LDI r2, 111
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
