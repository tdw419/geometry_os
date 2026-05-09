; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (202, 46) spanning 18 by 35 pixels. Then Places a yellow dot at position (140, 164).
; PLAN: r0=202(x), r1=46(y), r2=18(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=140(x), r1=164(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow rectangular region at (202, 46) spanning 18 by 35 pixels.
; PLAN: r0=202(x), r1=46(y), r2=18(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 46
LDI r2, 18
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (140, 164).
; PLAN: r0=140(x), r1=164(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 164
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
