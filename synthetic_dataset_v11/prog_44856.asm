; DESCRIPTION: Composite: . Then Places a magenta 45x65 rectangle at position (208, 127). Then Places a blue dot at position (211, 18).
; PLAN: r0=208(x), r1=127(y), r2=45(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=211(x), r1=18(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta 45x65 rectangle at position (208, 127).
; PLAN: r0=208(x), r1=127(y), r2=45(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 127
LDI r2, 45
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (211, 18).
; PLAN: r0=211(x), r1=18(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 211
LDI r1, 18
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
