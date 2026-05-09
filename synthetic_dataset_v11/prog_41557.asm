; DESCRIPTION: Composite: . Then Draws a blue line from (57, 171) to (207, 59). Then Places a green dot at position (221, 182).
; PLAN: r0=57(x1), r1=171(y1), r2=207(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=221(x), r1=182(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue line from (57, 171) to (207, 59).
; PLAN: r0=57(x1), r1=171(y1), r2=207(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 171
LDI r2, 207
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (221, 182).
; PLAN: r0=221(x), r1=182(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 221
LDI r1, 182
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
