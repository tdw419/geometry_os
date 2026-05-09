; DESCRIPTION: Renders a cyan box of size 97x117 starting at (126, 91).
; PLAN: r0=126(x), r1=91(y), r2=97(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 91
LDI r2, 97
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
