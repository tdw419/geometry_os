; DESCRIPTION: Renders a cyan box of size 97x68 starting at (382, 132).
; PLAN: r0=382(x), r1=132(y), r2=97(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 132
LDI r2, 97
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
