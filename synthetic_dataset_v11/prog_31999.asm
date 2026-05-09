; DESCRIPTION: Composite: . Then Places a black dot at position (63, 209). Then Creates a blue rectangular region at (165, 50) spanning 20 by 114 pixels.
; PLAN: r0=63(x), r1=209(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=165(x), r1=50(y), r2=20(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (63, 209).
; PLAN: r0=63(x), r1=209(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 209
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a blue rectangular region at (165, 50) spanning 20 by 114 pixels.
; PLAN: r0=165(x), r1=50(y), r2=20(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 50
LDI r2, 20
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
