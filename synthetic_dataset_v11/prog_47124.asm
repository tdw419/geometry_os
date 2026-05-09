; DESCRIPTION: Composite: . Then Places a purple 59x80 rectangle at position (24, 29). Then Sets a single cyan pixel at (3, 130).
; PLAN: r0=24(x), r1=29(y), r2=59(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=3(x), r1=130(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple 59x80 rectangle at position (24, 29).
; PLAN: r0=24(x), r1=29(y), r2=59(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 29
LDI r2, 59
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (3, 130).
; PLAN: r0=3(x), r1=130(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 130
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
