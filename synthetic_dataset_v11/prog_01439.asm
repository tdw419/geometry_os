; DESCRIPTION: Composite: . Then Renders a white box of size 23x57 starting at (223, 108). Then Sets a single yellow pixel at (209, 94).
; PLAN: r0=223(x), r1=108(y), r2=23(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=209(x), r1=94(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white box of size 23x57 starting at (223, 108).
; PLAN: r0=223(x), r1=108(y), r2=23(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 108
LDI r2, 23
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (209, 94).
; PLAN: r0=209(x), r1=94(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 209
LDI r1, 94
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
