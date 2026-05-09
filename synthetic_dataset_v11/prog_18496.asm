; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (13, 19) spanning 97 by 110 pixels. Then Places a cyan dot at position (8, 181).
; PLAN: r0=13(x), r1=19(y), r2=97(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=8(x), r1=181(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a cyan rectangular region at (13, 19) spanning 97 by 110 pixels.
; PLAN: r0=13(x), r1=19(y), r2=97(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 19
LDI r2, 97
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (8, 181).
; PLAN: r0=8(x), r1=181(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 8
LDI r1, 181
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
