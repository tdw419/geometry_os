; DESCRIPTION: Composite: . Then Creates a black rectangular region at (157, 125) spanning 97 by 40 pixels. Then Sets a single blue pixel at (237, 198).
; PLAN: r0=157(x), r1=125(y), r2=97(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=237(x), r1=198(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black rectangular region at (157, 125) spanning 97 by 40 pixels.
; PLAN: r0=157(x), r1=125(y), r2=97(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 125
LDI r2, 97
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (237, 198).
; PLAN: r0=237(x), r1=198(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 198
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
