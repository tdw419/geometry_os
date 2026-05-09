; DESCRIPTION: Composite: . Then Places a purple dot at position (143, 15). Then Places a green 54x113 rectangle at position (139, 137).
; PLAN: r0=143(x), r1=15(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=139(x), r1=137(y), r2=54(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (143, 15).
; PLAN: r0=143(x), r1=15(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 143
LDI r1, 15
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a green 54x113 rectangle at position (139, 137).
; PLAN: r0=139(x), r1=137(y), r2=54(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 137
LDI r2, 54
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
