; DESCRIPTION: Composite: . Then Places a white dot at position (228, 131). Then Draws a blue line from (249, 55) to (218, 202).
; PLAN: r0=228(x), r1=131(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=249(x1), r1=55(y1), r2=218(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (228, 131).
; PLAN: r0=228(x), r1=131(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 131
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a blue line from (249, 55) to (218, 202).
; PLAN: r0=249(x1), r1=55(y1), r2=218(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 55
LDI r2, 218
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
