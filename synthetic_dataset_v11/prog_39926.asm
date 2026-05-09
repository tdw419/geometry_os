; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (112, 186) spanning 17 by 51 pixels. Then Sets a single blue pixel at (93, 198).
; PLAN: r0=112(x), r1=186(y), r2=17(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=93(x), r1=198(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a cyan rectangular region at (112, 186) spanning 17 by 51 pixels.
; PLAN: r0=112(x), r1=186(y), r2=17(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 186
LDI r2, 17
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (93, 198).
; PLAN: r0=93(x), r1=198(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 198
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
