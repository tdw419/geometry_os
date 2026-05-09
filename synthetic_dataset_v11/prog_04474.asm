; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (135, 156). Then Creates a magenta rectangular region at (90, 59) spanning 99 by 97 pixels.
; PLAN: r0=135(x), r1=156(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=90(x), r1=59(y), r2=99(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (135, 156).
; PLAN: r0=135(x), r1=156(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 135
LDI r1, 156
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta rectangular region at (90, 59) spanning 99 by 97 pixels.
; PLAN: r0=90(x), r1=59(y), r2=99(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 59
LDI r2, 99
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
