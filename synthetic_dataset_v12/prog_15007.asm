; DESCRIPTION: Renders a green box of size 32x34 starting at (8, 180).
; PLAN: r0=8(x), r1=180(y), r2=32(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 180
LDI r2, 32
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
