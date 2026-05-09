; DESCRIPTION: Composite: . Then Places a magenta dot at position (48, 59). Then Creates a yellow rectangular region at (197, 81) spanning 46 by 84 pixels.
; PLAN: r0=48(x), r1=59(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=197(x), r1=81(y), r2=46(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (48, 59).
; PLAN: r0=48(x), r1=59(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 48
LDI r1, 59
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow rectangular region at (197, 81) spanning 46 by 84 pixels.
; PLAN: r0=197(x), r1=81(y), r2=46(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 81
LDI r2, 46
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
