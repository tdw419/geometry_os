; DESCRIPTION: Composite: . Then Renders a cyan box of size 94x35 starting at (99, 153). Then Places a purple dot at position (106, 178).
; PLAN: r0=99(x), r1=153(y), r2=94(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=106(x), r1=178(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan box of size 94x35 starting at (99, 153).
; PLAN: r0=99(x), r1=153(y), r2=94(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 153
LDI r2, 94
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (106, 178).
; PLAN: r0=106(x), r1=178(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 178
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
