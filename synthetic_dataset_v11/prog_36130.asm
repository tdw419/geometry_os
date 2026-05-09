; DESCRIPTION: Places a cyan 22x112 rectangle at position (75, 97).
; PLAN: r0=75(x), r1=97(y), r2=22(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 97
LDI r2, 22
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
