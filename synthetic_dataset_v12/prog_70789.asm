; DESCRIPTION: Renders a green box of size 100x18 starting at (391, 87).
; PLAN: r0=391(x), r1=87(y), r2=100(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 87
LDI r2, 100
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
