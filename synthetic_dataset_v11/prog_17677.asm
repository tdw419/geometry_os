; DESCRIPTION: Renders a cyan box of size 110x94 starting at (89, 61).
; PLAN: r0=89(x), r1=61(y), r2=110(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 61
LDI r2, 110
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
