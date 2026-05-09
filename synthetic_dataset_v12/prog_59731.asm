; DESCRIPTION: Renders a green box of size 37x86 starting at (310, 11).
; PLAN: r0=310(x), r1=11(y), r2=37(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 11
LDI r2, 37
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
