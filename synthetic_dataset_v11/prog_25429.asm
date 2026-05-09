; DESCRIPTION: Composite: . Then Places a blue dot at position (94, 75). Then Renders a red box of size 23x78 starting at (113, 132).
; PLAN: r0=94(x), r1=75(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=113(x), r1=132(y), r2=23(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (94, 75).
; PLAN: r0=94(x), r1=75(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 94
LDI r1, 75
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a red box of size 23x78 starting at (113, 132).
; PLAN: r0=113(x), r1=132(y), r2=23(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 132
LDI r2, 23
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
