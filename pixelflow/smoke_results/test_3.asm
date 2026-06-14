; DESCRIPTION: Draws a green rectangle of size 64x64 at the top-left corner (0, 0).
; PLAN: r0=0(x), r1=0(y), r2=64(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 0
LDI r2, 64
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT