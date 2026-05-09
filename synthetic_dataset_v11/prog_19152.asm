; DESCRIPTION: Composite: . Then Places a blue 95x19 rectangle at position (146, 81). Then Places a purple dot at position (205, 249).
; PLAN: r0=146(x), r1=81(y), r2=95(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=205(x), r1=249(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue 95x19 rectangle at position (146, 81).
; PLAN: r0=146(x), r1=81(y), r2=95(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 81
LDI r2, 95
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (205, 249).
; PLAN: r0=205(x), r1=249(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 205
LDI r1, 249
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
