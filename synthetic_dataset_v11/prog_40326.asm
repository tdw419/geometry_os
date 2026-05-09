; DESCRIPTION: Renders a cyan box of size 87x31 starting at (136, 82).
; PLAN: r0=136(x), r1=82(y), r2=87(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 82
LDI r2, 87
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
