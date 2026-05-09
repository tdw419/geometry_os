; DESCRIPTION: Renders a green box of size 21x102 starting at (150, 105).
; PLAN: r0=150(x), r1=105(y), r2=21(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 105
LDI r2, 21
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
