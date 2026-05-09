; DESCRIPTION: Composite: . Then Places a magenta dot at position (70, 69). Then Creates a magenta rectangular region at (111, 62) spanning 97 by 46 pixels.
; PLAN: r0=70(x), r1=69(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=111(x), r1=62(y), r2=97(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (70, 69).
; PLAN: r0=70(x), r1=69(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 69
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta rectangular region at (111, 62) spanning 97 by 46 pixels.
; PLAN: r0=111(x), r1=62(y), r2=97(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 62
LDI r2, 97
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
