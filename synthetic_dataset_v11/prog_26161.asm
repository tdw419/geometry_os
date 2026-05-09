; DESCRIPTION: Composite: . Then Places a purple 75x115 rectangle at position (135, 72). Then Sets a single yellow pixel at (249, 198).
; PLAN: r0=135(x), r1=72(y), r2=75(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=249(x), r1=198(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple 75x115 rectangle at position (135, 72).
; PLAN: r0=135(x), r1=72(y), r2=75(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 72
LDI r2, 75
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (249, 198).
; PLAN: r0=249(x), r1=198(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 198
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
