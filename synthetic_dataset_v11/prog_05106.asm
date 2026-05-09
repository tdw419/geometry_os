; DESCRIPTION: Composite: . Then Sets a single black pixel at (30, 221). Then Places a purple 10x59 rectangle at position (183, 14).
; PLAN: r0=30(x), r1=221(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=183(x), r1=14(y), r2=10(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (30, 221).
; PLAN: r0=30(x), r1=221(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 30
LDI r1, 221
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a purple 10x59 rectangle at position (183, 14).
; PLAN: r0=183(x), r1=14(y), r2=10(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 14
LDI r2, 10
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
