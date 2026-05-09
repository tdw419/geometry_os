; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (60, 1) spanning 35 by 120 pixels. Then Places a yellow dot at position (159, 108).
; PLAN: r0=60(x), r1=1(y), r2=35(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=159(x), r1=108(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta rectangular region at (60, 1) spanning 35 by 120 pixels.
; PLAN: r0=60(x), r1=1(y), r2=35(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 1
LDI r2, 35
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (159, 108).
; PLAN: r0=159(x), r1=108(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 159
LDI r1, 108
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
