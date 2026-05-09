; DESCRIPTION: Composite: . Then Places a magenta dot at position (210, 153). Then Creates a yellow rectangular region at (18, 84) spanning 95 by 100 pixels.
; PLAN: r0=210(x), r1=153(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=18(x), r1=84(y), r2=95(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (210, 153).
; PLAN: r0=210(x), r1=153(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 210
LDI r1, 153
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow rectangular region at (18, 84) spanning 95 by 100 pixels.
; PLAN: r0=18(x), r1=84(y), r2=95(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 84
LDI r2, 95
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
