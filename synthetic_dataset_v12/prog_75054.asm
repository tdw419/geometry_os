; DESCRIPTION: Renders a cyan box of size 66x19 starting at (145, 201).
; PLAN: r0=145(x), r1=201(y), r2=66(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 201
LDI r2, 66
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
