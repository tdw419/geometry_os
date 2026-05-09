; DESCRIPTION: Composite: . Then Creates a purple rectangular region at (210, 195) spanning 33 by 52 pixels. Then Sets a single green pixel at (28, 3).
; PLAN: r0=210(x), r1=195(y), r2=33(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=28(x), r1=3(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a purple rectangular region at (210, 195) spanning 33 by 52 pixels.
; PLAN: r0=210(x), r1=195(y), r2=33(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 195
LDI r2, 33
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (28, 3).
; PLAN: r0=28(x), r1=3(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 28
LDI r1, 3
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
