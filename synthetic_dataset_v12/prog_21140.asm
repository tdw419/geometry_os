; DESCRIPTION: Renders a green box of size 39x42 starting at (310, 137).
; PLAN: r0=310(x), r1=137(y), r2=39(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 137
LDI r2, 39
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
