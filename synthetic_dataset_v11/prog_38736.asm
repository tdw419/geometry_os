; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (59, 191) with radius 14. Then Places a green dot at position (248, 228).
; PLAN: r0=59(x), r1=191(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=248(x), r1=228(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta circle centered at (59, 191) with radius 14.
; PLAN: r0=59(x), r1=191(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 191
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green dot at position (248, 228).
; PLAN: r0=248(x), r1=228(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 248
LDI r1, 228
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
