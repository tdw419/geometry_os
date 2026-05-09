; DESCRIPTION: Composite: . Then Places a red dot at position (187, 37). Then Draws a green line from (182, 124) to (223, 219).
; PLAN: r0=187(x), r1=37(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=182(x1), r1=124(y1), r2=223(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (187, 37).
; PLAN: r0=187(x), r1=37(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 187
LDI r1, 37
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a green line from (182, 124) to (223, 219).
; PLAN: r0=182(x1), r1=124(y1), r2=223(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 124
LDI r2, 223
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
