; DESCRIPTION: Composite: . Then Places a blue dot at position (3, 56). Then Places a blue 58x48 rectangle at position (39, 193).
; PLAN: r0=3(x), r1=56(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=39(x), r1=193(y), r2=58(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (3, 56).
; PLAN: r0=3(x), r1=56(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 56
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a blue 58x48 rectangle at position (39, 193).
; PLAN: r0=39(x), r1=193(y), r2=58(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 193
LDI r2, 58
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
