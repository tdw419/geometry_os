; DESCRIPTION: Composite: . Then Places a purple dot at position (19, 177). Then Renders a cyan box of size 45x107 starting at (12, 70).
; PLAN: r0=19(x), r1=177(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=12(x), r1=70(y), r2=45(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (19, 177).
; PLAN: r0=19(x), r1=177(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 177
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan box of size 45x107 starting at (12, 70).
; PLAN: r0=12(x), r1=70(y), r2=45(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 70
LDI r2, 45
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
