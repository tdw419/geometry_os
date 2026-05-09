; DESCRIPTION: Renders a green box of size 60x57 starting at (89, 166).
; PLAN: r0=89(x), r1=166(y), r2=60(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 166
LDI r2, 60
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
