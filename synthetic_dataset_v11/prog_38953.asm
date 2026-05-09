; DESCRIPTION: Composite: . Then Places a black dot at position (124, 9). Then Creates a yellow rectangular region at (36, 44) spanning 102 by 44 pixels.
; PLAN: r0=124(x), r1=9(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=36(x), r1=44(y), r2=102(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (124, 9).
; PLAN: r0=124(x), r1=9(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 124
LDI r1, 9
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow rectangular region at (36, 44) spanning 102 by 44 pixels.
; PLAN: r0=36(x), r1=44(y), r2=102(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 44
LDI r2, 102
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
