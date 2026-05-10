; DESCRIPTION: Creates a cyan filled rectangle of size 20x81 starting at (246, 25).
; PLAN: r0=246(x), r1=25(y), r2=20(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 25
LDI r2, 20
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
