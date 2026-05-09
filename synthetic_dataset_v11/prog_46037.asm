; DESCRIPTION: Composite: . Then Places a green 12x113 rectangle at position (118, 7). Then Places a blue dot at position (249, 220).
; PLAN: r0=118(x), r1=7(y), r2=12(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=249(x), r1=220(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green 12x113 rectangle at position (118, 7).
; PLAN: r0=118(x), r1=7(y), r2=12(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 7
LDI r2, 12
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (249, 220).
; PLAN: r0=249(x), r1=220(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 220
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
