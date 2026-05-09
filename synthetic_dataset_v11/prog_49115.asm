; DESCRIPTION: Renders a green box of size 75x108 starting at (107, 50).
; PLAN: r0=107(x), r1=50(y), r2=75(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 50
LDI r2, 75
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
