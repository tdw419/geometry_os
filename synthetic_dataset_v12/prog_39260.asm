; DESCRIPTION: Renders a cyan box of size 66x63 starting at (163, 7).
; PLAN: r0=163(x), r1=7(y), r2=66(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 7
LDI r2, 66
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
