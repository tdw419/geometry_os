; DESCRIPTION: Renders a cyan box of size 15x63 starting at (87, 94).
; PLAN: r0=87(x), r1=94(y), r2=15(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 94
LDI r2, 15
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
