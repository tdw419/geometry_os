; DESCRIPTION: Composite: . Then Places a magenta dot at position (106, 184). Then Creates a yellow rectangular region at (33, 153) spanning 42 by 28 pixels.
; PLAN: r0=106(x), r1=184(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=33(x), r1=153(y), r2=42(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (106, 184).
; PLAN: r0=106(x), r1=184(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 184
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow rectangular region at (33, 153) spanning 42 by 28 pixels.
; PLAN: r0=33(x), r1=153(y), r2=42(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 153
LDI r2, 42
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
