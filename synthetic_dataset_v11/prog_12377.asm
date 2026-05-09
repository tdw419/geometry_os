; DESCRIPTION: Composite: . Then Places a cyan dot at position (109, 92). Then Creates a orange rectangular region at (58, 15) spanning 69 by 40 pixels.
; PLAN: r0=109(x), r1=92(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=58(x), r1=15(y), r2=69(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (109, 92).
; PLAN: r0=109(x), r1=92(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 92
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a orange rectangular region at (58, 15) spanning 69 by 40 pixels.
; PLAN: r0=58(x), r1=15(y), r2=69(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 15
LDI r2, 69
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
