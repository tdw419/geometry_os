; DESCRIPTION: Renders a green box of size 69x65 starting at (391, 31).
; PLAN: r0=391(x), r1=31(y), r2=69(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 31
LDI r2, 69
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
