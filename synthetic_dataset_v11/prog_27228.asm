; DESCRIPTION: Renders a green box of size 66x27 starting at (128, 132).
; PLAN: r0=128(x), r1=132(y), r2=66(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 132
LDI r2, 66
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
