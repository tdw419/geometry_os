; DESCRIPTION: Composite: . Then Places a magenta dot at position (73, 19). Then Creates a red rectangular region at (103, 233) spanning 34 by 11 pixels.
; PLAN: r0=73(x), r1=19(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=103(x), r1=233(y), r2=34(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (73, 19).
; PLAN: r0=73(x), r1=19(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 73
LDI r1, 19
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a red rectangular region at (103, 233) spanning 34 by 11 pixels.
; PLAN: r0=103(x), r1=233(y), r2=34(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 233
LDI r2, 34
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
