; DESCRIPTION: Renders a cyan box of size 60x60 starting at (418, 66).
; PLAN: r0=418(x), r1=66(y), r2=60(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 66
LDI r2, 60
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
