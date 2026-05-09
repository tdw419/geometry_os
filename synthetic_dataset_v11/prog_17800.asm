; DESCRIPTION: Composite: . Then Places a cyan dot at position (154, 130). Then Creates a cyan rectangular region at (136, 131) spanning 20 by 43 pixels.
; PLAN: r0=154(x), r1=130(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=136(x), r1=131(y), r2=20(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (154, 130).
; PLAN: r0=154(x), r1=130(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 130
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan rectangular region at (136, 131) spanning 20 by 43 pixels.
; PLAN: r0=136(x), r1=131(y), r2=20(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 131
LDI r2, 20
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
