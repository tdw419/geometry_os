; DESCRIPTION: Renders a green box of size 57x10 starting at (417, 89).
; PLAN: r0=417(x), r1=89(y), r2=57(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 89
LDI r2, 57
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
