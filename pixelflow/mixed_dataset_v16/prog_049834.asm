; DESCRIPTION: Renders a cyan box of size 19x57 starting at (83, 104).
; PLAN: r0=83(x), r1=104(y), r2=19(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 104
LDI r2, 19
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
