; DESCRIPTION: Composite: . Then Creates a red circular shape at (134, 107) with radius 57. Then Draws a white line from (176, 184) to (4, 86).
; PLAN: r0=134(x), r1=107(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=176(x1), r1=184(y1), r2=4(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red circular shape at (134, 107) with radius 57.
; PLAN: r0=134(x), r1=107(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 107
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white line from (176, 184) to (4, 86).
; PLAN: r0=176(x1), r1=184(y1), r2=4(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 184
LDI r2, 4
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
