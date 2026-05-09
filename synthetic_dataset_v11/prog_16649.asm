; DESCRIPTION: Composite: . Then Places a black dot at position (61, 219). Then Creates a red rectangular region at (145, 190) spanning 86 by 65 pixels.
; PLAN: r0=61(x), r1=219(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=145(x), r1=190(y), r2=86(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (61, 219).
; PLAN: r0=61(x), r1=219(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 61
LDI r1, 219
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a red rectangular region at (145, 190) spanning 86 by 65 pixels.
; PLAN: r0=145(x), r1=190(y), r2=86(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 190
LDI r2, 86
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
