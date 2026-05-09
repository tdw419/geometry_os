; DESCRIPTION: Composite: . Then Places a magenta 40x53 rectangle at position (29, 118). Then Places a green dot at position (137, 19).
; PLAN: r0=29(x), r1=118(y), r2=40(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=137(x), r1=19(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta 40x53 rectangle at position (29, 118).
; PLAN: r0=29(x), r1=118(y), r2=40(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 118
LDI r2, 40
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (137, 19).
; PLAN: r0=137(x), r1=19(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 19
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
