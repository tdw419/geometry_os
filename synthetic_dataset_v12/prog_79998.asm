; DESCRIPTION: Renders a blue box of size 31x30 starting at (307, 128).
; PLAN: r0=307(x), r1=128(y), r2=31(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 128
LDI r2, 31
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
