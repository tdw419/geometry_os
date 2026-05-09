; DESCRIPTION: Composite: . Then Sets a single purple pixel at (92, 207). Then Creates a magenta rectangular region at (33, 20) spanning 61 by 59 pixels.
; PLAN: r0=92(x), r1=207(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=33(x), r1=20(y), r2=61(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (92, 207).
; PLAN: r0=92(x), r1=207(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 92
LDI r1, 207
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta rectangular region at (33, 20) spanning 61 by 59 pixels.
; PLAN: r0=33(x), r1=20(y), r2=61(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 20
LDI r2, 61
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
