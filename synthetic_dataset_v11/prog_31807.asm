; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (163, 112) spanning 88 by 95 pixels. Then Places a orange dot at position (129, 77).
; PLAN: r0=163(x), r1=112(y), r2=88(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=129(x), r1=77(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta rectangular region at (163, 112) spanning 88 by 95 pixels.
; PLAN: r0=163(x), r1=112(y), r2=88(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 112
LDI r2, 88
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (129, 77).
; PLAN: r0=129(x), r1=77(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 129
LDI r1, 77
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
