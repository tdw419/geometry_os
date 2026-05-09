; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (134, 161) with radius 70. Then Places a red dot at position (57, 221).
; PLAN: r0=134(x), r1=161(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=57(x), r1=221(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan circle centered at (134, 161) with radius 70.
; PLAN: r0=134(x), r1=161(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 161
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (57, 221).
; PLAN: r0=57(x), r1=221(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 57
LDI r1, 221
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
