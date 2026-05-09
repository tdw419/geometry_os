; DESCRIPTION: Composite: . Then Places a black dot at position (231, 20). Then Creates a cyan rectangular region at (37, 163) spanning 76 by 33 pixels.
; PLAN: r0=231(x), r1=20(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=37(x), r1=163(y), r2=76(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (231, 20).
; PLAN: r0=231(x), r1=20(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 231
LDI r1, 20
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan rectangular region at (37, 163) spanning 76 by 33 pixels.
; PLAN: r0=37(x), r1=163(y), r2=76(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 163
LDI r2, 76
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
