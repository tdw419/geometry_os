; DESCRIPTION: Composite: . Then Places a magenta dot at position (8, 234). Then Creates a green rectangular region at (1, 108) spanning 90 by 98 pixels.
; PLAN: r0=8(x), r1=234(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=1(x), r1=108(y), r2=90(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (8, 234).
; PLAN: r0=8(x), r1=234(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 8
LDI r1, 234
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a green rectangular region at (1, 108) spanning 90 by 98 pixels.
; PLAN: r0=1(x), r1=108(y), r2=90(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 108
LDI r2, 90
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
