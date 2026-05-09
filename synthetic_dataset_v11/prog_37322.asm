; DESCRIPTION: Composite: . Then Creates a white rectangular region at (94, 128) spanning 97 by 29 pixels. Then Sets a single cyan pixel at (254, 98).
; PLAN: r0=94(x), r1=128(y), r2=97(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=254(x), r1=98(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a white rectangular region at (94, 128) spanning 97 by 29 pixels.
; PLAN: r0=94(x), r1=128(y), r2=97(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 128
LDI r2, 97
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (254, 98).
; PLAN: r0=254(x), r1=98(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 254
LDI r1, 98
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
