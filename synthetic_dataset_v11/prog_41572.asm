; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (26, 3) spanning 79 by 74 pixels. Then Places a black dot at position (105, 149).
; PLAN: r0=26(x), r1=3(y), r2=79(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=105(x), r1=149(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow rectangular region at (26, 3) spanning 79 by 74 pixels.
; PLAN: r0=26(x), r1=3(y), r2=79(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 3
LDI r2, 79
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (105, 149).
; PLAN: r0=105(x), r1=149(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 105
LDI r1, 149
LDI r2, 0x000000
PSET r0, r1, r2
HALT
