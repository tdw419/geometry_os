; DESCRIPTION: Renders a green box of size 13x12 starting at (174, 198).
; PLAN: r0=174(x), r1=198(y), r2=13(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 198
LDI r2, 13
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
