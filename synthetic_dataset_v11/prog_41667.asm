; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (45, 86) spanning 46 by 72 pixels. Then Places a cyan dot at position (32, 5).
; PLAN: r0=45(x), r1=86(y), r2=46(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=32(x), r1=5(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow rectangular region at (45, 86) spanning 46 by 72 pixels.
; PLAN: r0=45(x), r1=86(y), r2=46(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 86
LDI r2, 46
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (32, 5).
; PLAN: r0=32(x), r1=5(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 5
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
