; DESCRIPTION: Composite: . Then Places a purple 98x116 rectangle at position (60, 96). Then Places a cyan dot at position (33, 3).
; PLAN: r0=60(x), r1=96(y), r2=98(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=33(x), r1=3(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple 98x116 rectangle at position (60, 96).
; PLAN: r0=60(x), r1=96(y), r2=98(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 96
LDI r2, 98
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (33, 3).
; PLAN: r0=33(x), r1=3(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 33
LDI r1, 3
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
