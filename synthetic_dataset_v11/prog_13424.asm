; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (132, 79) spanning 76 by 71 pixels. Then Sets a single blue pixel at (186, 253).
; PLAN: r0=132(x), r1=79(y), r2=76(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=186(x), r1=253(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a cyan rectangular region at (132, 79) spanning 76 by 71 pixels.
; PLAN: r0=132(x), r1=79(y), r2=76(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 79
LDI r2, 76
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (186, 253).
; PLAN: r0=186(x), r1=253(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 186
LDI r1, 253
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
