; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (38, 29) spanning 112 by 114 pixels. Then Places a purple dot at position (149, 59).
; PLAN: r0=38(x), r1=29(y), r2=112(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=149(x), r1=59(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta rectangular region at (38, 29) spanning 112 by 114 pixels.
; PLAN: r0=38(x), r1=29(y), r2=112(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 29
LDI r2, 112
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (149, 59).
; PLAN: r0=149(x), r1=59(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 149
LDI r1, 59
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
