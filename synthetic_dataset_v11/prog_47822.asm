; DESCRIPTION: Composite: . Then Places a magenta dot at position (194, 220). Then Places a green 13x54 rectangle at position (26, 90).
; PLAN: r0=194(x), r1=220(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=26(x), r1=90(y), r2=13(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (194, 220).
; PLAN: r0=194(x), r1=220(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 194
LDI r1, 220
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a green 13x54 rectangle at position (26, 90).
; PLAN: r0=26(x), r1=90(y), r2=13(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 90
LDI r2, 13
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
