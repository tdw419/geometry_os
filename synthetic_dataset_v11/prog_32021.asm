; DESCRIPTION: Renders a cyan box of size 66x97 starting at (156, 15).
; PLAN: r0=156(x), r1=15(y), r2=66(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 15
LDI r2, 66
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
