; DESCRIPTION: Composite: . Then Places a green dot at position (96, 10). Then Places a magenta 70x31 rectangle at position (97, 216).
; PLAN: r0=96(x), r1=10(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=97(x), r1=216(y), r2=70(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (96, 10).
; PLAN: r0=96(x), r1=10(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 96
LDI r1, 10
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a magenta 70x31 rectangle at position (97, 216).
; PLAN: r0=97(x), r1=216(y), r2=70(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 216
LDI r2, 70
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
