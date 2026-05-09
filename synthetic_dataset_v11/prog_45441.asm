; DESCRIPTION: Composite: . Then Places a blue dot at position (54, 87). Then Places a green 117x113 rectangle at position (52, 109).
; PLAN: r0=54(x), r1=87(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=52(x), r1=109(y), r2=117(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (54, 87).
; PLAN: r0=54(x), r1=87(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 54
LDI r1, 87
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a green 117x113 rectangle at position (52, 109).
; PLAN: r0=52(x), r1=109(y), r2=117(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 109
LDI r2, 117
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
