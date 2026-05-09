; DESCRIPTION: Renders a cyan box of size 90x94 starting at (63, 78).
; PLAN: r0=63(x), r1=78(y), r2=90(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 78
LDI r2, 90
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
