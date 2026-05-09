; DESCRIPTION: Composite: . Then Draws a white line from (19, 3) to (57, 222). Then Places a orange dot at position (178, 250).
; PLAN: r0=19(x1), r1=3(y1), r2=57(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=178(x), r1=250(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (19, 3) to (57, 222).
; PLAN: r0=19(x1), r1=3(y1), r2=57(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 3
LDI r2, 57
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (178, 250).
; PLAN: r0=178(x), r1=250(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 250
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
