; DESCRIPTION: Renders a cyan box of size 98x94 starting at (126, 81).
; PLAN: r0=126(x), r1=81(y), r2=98(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 81
LDI r2, 98
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
