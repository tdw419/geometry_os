; DESCRIPTION: Renders a green box of size 76x98 starting at (391, 40).
; PLAN: r0=391(x), r1=40(y), r2=76(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 40
LDI r2, 76
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
