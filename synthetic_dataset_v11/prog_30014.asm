; DESCRIPTION: Composite: . Then Places a purple 50x58 rectangle at position (35, 137). Then Places a yellow dot at position (217, 72).
; PLAN: r0=35(x), r1=137(y), r2=50(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=217(x), r1=72(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple 50x58 rectangle at position (35, 137).
; PLAN: r0=35(x), r1=137(y), r2=50(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 137
LDI r2, 50
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (217, 72).
; PLAN: r0=217(x), r1=72(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 217
LDI r1, 72
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
