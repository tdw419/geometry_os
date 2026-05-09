; DESCRIPTION: Renders a cyan box of size 66x93 starting at (83, 116).
; PLAN: r0=83(x), r1=116(y), r2=66(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 116
LDI r2, 66
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
