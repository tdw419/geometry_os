; DESCRIPTION: Composite: . Then Creates a black rectangular region at (200, 145) spanning 44 by 22 pixels. Then Places a magenta dot at position (197, 64).
; PLAN: r0=200(x), r1=145(y), r2=44(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=197(x), r1=64(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black rectangular region at (200, 145) spanning 44 by 22 pixels.
; PLAN: r0=200(x), r1=145(y), r2=44(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 145
LDI r2, 44
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (197, 64).
; PLAN: r0=197(x), r1=64(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 64
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
