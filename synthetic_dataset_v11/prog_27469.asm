; DESCRIPTION: Composite: . Then Places a red dot at position (59, 165). Then Draws a white line from (74, 31) to (127, 162).
; PLAN: r0=59(x), r1=165(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=74(x1), r1=31(y1), r2=127(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (59, 165).
; PLAN: r0=59(x), r1=165(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 59
LDI r1, 165
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a white line from (74, 31) to (127, 162).
; PLAN: r0=74(x1), r1=31(y1), r2=127(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 31
LDI r2, 127
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
