; DESCRIPTION: Composite: . Then Places a green dot at position (253, 5). Then Creates a purple rectangular region at (24, 145) spanning 16 by 106 pixels.
; PLAN: r0=253(x), r1=5(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=24(x), r1=145(y), r2=16(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (253, 5).
; PLAN: r0=253(x), r1=5(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 253
LDI r1, 5
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a purple rectangular region at (24, 145) spanning 16 by 106 pixels.
; PLAN: r0=24(x), r1=145(y), r2=16(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 145
LDI r2, 16
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
