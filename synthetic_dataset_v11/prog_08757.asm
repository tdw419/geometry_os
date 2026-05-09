; DESCRIPTION: Renders a green box of size 75x30 starting at (140, 91).
; PLAN: r0=140(x), r1=91(y), r2=75(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 91
LDI r2, 75
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
