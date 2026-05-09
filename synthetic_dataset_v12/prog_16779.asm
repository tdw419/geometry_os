; DESCRIPTION: Renders a black box of size 37x87 starting at (307, 86).
; PLAN: r0=307(x), r1=86(y), r2=37(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 86
LDI r2, 37
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
