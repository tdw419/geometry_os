; DESCRIPTION: Composite: . Then Places a purple 99x16 rectangle at position (44, 100). Then Places a black dot at position (62, 27).
; PLAN: r0=44(x), r1=100(y), r2=99(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=62(x), r1=27(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple 99x16 rectangle at position (44, 100).
; PLAN: r0=44(x), r1=100(y), r2=99(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 100
LDI r2, 99
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (62, 27).
; PLAN: r0=62(x), r1=27(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 27
LDI r2, 0x000000
PSET r0, r1, r2
HALT
