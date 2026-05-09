; DESCRIPTION: Renders a green box of size 81x64 starting at (246, 66).
; PLAN: r0=246(x), r1=66(y), r2=81(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 66
LDI r2, 81
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
