; DESCRIPTION: Renders a green box of size 66x57 starting at (56, 94).
; PLAN: r0=56(x), r1=94(y), r2=66(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 94
LDI r2, 66
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
