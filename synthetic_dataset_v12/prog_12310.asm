; DESCRIPTION: Renders a cyan box of size 32x66 starting at (363, 60).
; PLAN: r0=363(x), r1=60(y), r2=32(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 60
LDI r2, 32
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
