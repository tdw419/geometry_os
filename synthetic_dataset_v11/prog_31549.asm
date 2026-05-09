; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (66, 29). Then Creates a yellow rectangular region at (49, 35) spanning 113 by 95 pixels.
; PLAN: r0=66(x), r1=29(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=49(x), r1=35(y), r2=113(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (66, 29).
; PLAN: r0=66(x), r1=29(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 29
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow rectangular region at (49, 35) spanning 113 by 95 pixels.
; PLAN: r0=49(x), r1=35(y), r2=113(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 35
LDI r2, 113
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
