; DESCRIPTION: Renders a cyan box of size 14x63 starting at (414, 97).
; PLAN: r0=414(x), r1=97(y), r2=14(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 97
LDI r2, 14
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
