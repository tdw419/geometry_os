; DESCRIPTION: Creates a cyan filled rectangle of size 51x66 starting at (192, 136).
; PLAN: r0=192(x), r1=136(y), r2=51(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 136
LDI r2, 51
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
