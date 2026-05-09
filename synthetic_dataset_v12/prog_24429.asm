; DESCRIPTION: Renders a cyan box of size 58x81 starting at (128, 66).
; PLAN: r0=128(x), r1=66(y), r2=58(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 66
LDI r2, 58
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
