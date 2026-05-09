; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (99, 226). Then Creates a yellow rectangular region at (62, 44) spanning 37 by 107 pixels.
; PLAN: r0=99(x), r1=226(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=62(x), r1=44(y), r2=37(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (99, 226).
; PLAN: r0=99(x), r1=226(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 99
LDI r1, 226
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow rectangular region at (62, 44) spanning 37 by 107 pixels.
; PLAN: r0=62(x), r1=44(y), r2=37(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 44
LDI r2, 37
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
