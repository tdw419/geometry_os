; DESCRIPTION: Renders a cyan box of size 35x63 starting at (109, 79).
; PLAN: r0=109(x), r1=79(y), r2=35(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 79
LDI r2, 35
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
