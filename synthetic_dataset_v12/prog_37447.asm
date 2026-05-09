; DESCRIPTION: Renders a cyan box of size 64x44 starting at (179, 145).
; PLAN: r0=179(x), r1=145(y), r2=64(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 145
LDI r2, 64
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
