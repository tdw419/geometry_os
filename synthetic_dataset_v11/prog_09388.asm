; DESCRIPTION: Composite: . Then Places a yellow dot at position (167, 181). Then Creates a purple rectangular region at (38, 34) spanning 119 by 99 pixels.
; PLAN: r0=167(x), r1=181(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=38(x), r1=34(y), r2=119(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (167, 181).
; PLAN: r0=167(x), r1=181(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 181
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a purple rectangular region at (38, 34) spanning 119 by 99 pixels.
; PLAN: r0=38(x), r1=34(y), r2=119(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 34
LDI r2, 119
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
