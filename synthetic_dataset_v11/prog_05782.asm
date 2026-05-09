; DESCRIPTION: Renders a green box of size 107x74 starting at (115, 128).
; PLAN: r0=115(x), r1=128(y), r2=107(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 128
LDI r2, 107
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
