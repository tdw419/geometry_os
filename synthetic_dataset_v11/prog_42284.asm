; DESCRIPTION: Composite: . Then Places a purple 108x10 rectangle at position (37, 162). Then Places a red dot at position (172, 81).
; PLAN: r0=37(x), r1=162(y), r2=108(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=172(x), r1=81(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple 108x10 rectangle at position (37, 162).
; PLAN: r0=37(x), r1=162(y), r2=108(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 162
LDI r2, 108
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (172, 81).
; PLAN: r0=172(x), r1=81(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 81
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
