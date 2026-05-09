; DESCRIPTION: Composite: . Then Places a green 60x95 rectangle at position (34, 149). Then Places a black dot at position (105, 117).
; PLAN: r0=34(x), r1=149(y), r2=60(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=105(x), r1=117(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green 60x95 rectangle at position (34, 149).
; PLAN: r0=34(x), r1=149(y), r2=60(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 149
LDI r2, 60
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (105, 117).
; PLAN: r0=105(x), r1=117(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 105
LDI r1, 117
LDI r2, 0x000000
PSET r0, r1, r2
HALT
