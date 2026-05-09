; DESCRIPTION: Renders a cyan box of size 32x89 starting at (185, 61).
; PLAN: r0=185(x), r1=61(y), r2=32(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 61
LDI r2, 32
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
