; DESCRIPTION: Composite: . Then Sets a single green pixel at (245, 145). Then Creates a purple rectangular region at (125, 108) spanning 45 by 91 pixels.
; PLAN: r0=245(x), r1=145(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=125(x), r1=108(y), r2=45(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (245, 145).
; PLAN: r0=245(x), r1=145(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 145
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a purple rectangular region at (125, 108) spanning 45 by 91 pixels.
; PLAN: r0=125(x), r1=108(y), r2=45(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 108
LDI r2, 45
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
