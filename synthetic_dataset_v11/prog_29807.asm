; DESCRIPTION: Composite: . Then Sets a single blue pixel at (120, 71). Then Places a orange 72x73 rectangle at position (55, 46).
; PLAN: r0=120(x), r1=71(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=55(x), r1=46(y), r2=72(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (120, 71).
; PLAN: r0=120(x), r1=71(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 71
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a orange 72x73 rectangle at position (55, 46).
; PLAN: r0=55(x), r1=46(y), r2=72(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 46
LDI r2, 72
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
