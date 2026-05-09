; DESCRIPTION: Composite: . Then Places a red dot at position (149, 45). Then Places a purple 46x17 rectangle at position (182, 109).
; PLAN: r0=149(x), r1=45(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=182(x), r1=109(y), r2=46(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (149, 45).
; PLAN: r0=149(x), r1=45(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 149
LDI r1, 45
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a purple 46x17 rectangle at position (182, 109).
; PLAN: r0=182(x), r1=109(y), r2=46(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 109
LDI r2, 46
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
