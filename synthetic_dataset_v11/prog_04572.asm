; DESCRIPTION: Composite: . Then Creates a black rectangular region at (65, 118) spanning 74 by 90 pixels. Then Sets a single magenta pixel at (112, 231).
; PLAN: r0=65(x), r1=118(y), r2=74(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=112(x), r1=231(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black rectangular region at (65, 118) spanning 74 by 90 pixels.
; PLAN: r0=65(x), r1=118(y), r2=74(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 118
LDI r2, 74
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (112, 231).
; PLAN: r0=112(x), r1=231(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 112
LDI r1, 231
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
