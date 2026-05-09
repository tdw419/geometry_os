; DESCRIPTION: Composite: . Then Places a green dot at position (52, 144). Then Creates a white rectangular region at (163, 16) spanning 34 by 105 pixels.
; PLAN: r0=52(x), r1=144(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=163(x), r1=16(y), r2=34(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (52, 144).
; PLAN: r0=52(x), r1=144(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 144
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a white rectangular region at (163, 16) spanning 34 by 105 pixels.
; PLAN: r0=163(x), r1=16(y), r2=34(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 16
LDI r2, 34
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
