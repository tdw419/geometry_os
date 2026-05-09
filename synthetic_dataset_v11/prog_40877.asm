; DESCRIPTION: Places a cyan 114x56 rectangle at position (106, 90).
; PLAN: r0=106(x), r1=90(y), r2=114(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 90
LDI r2, 114
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
