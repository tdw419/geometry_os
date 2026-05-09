; DESCRIPTION: Composite: . Then Sets a single blue pixel at (48, 124). Then Places a purple 12x62 rectangle at position (152, 156).
; PLAN: r0=48(x), r1=124(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=152(x), r1=156(y), r2=12(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (48, 124).
; PLAN: r0=48(x), r1=124(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 48
LDI r1, 124
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a purple 12x62 rectangle at position (152, 156).
; PLAN: r0=152(x), r1=156(y), r2=12(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 156
LDI r2, 12
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
