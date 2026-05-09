; DESCRIPTION: Renders a cyan box of size 63x40 starting at (311, 205).
; PLAN: r0=311(x), r1=205(y), r2=63(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 205
LDI r2, 63
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
