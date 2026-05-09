; DESCRIPTION: Renders a green box of size 13x90 starting at (40, 11).
; PLAN: r0=40(x), r1=11(y), r2=13(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 11
LDI r2, 13
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
