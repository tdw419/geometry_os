; DESCRIPTION: Composite: . Then Draws a magenta line from (74, 67) to (164, 244). Then Places a yellow dot at position (20, 56).
; PLAN: r0=74(x1), r1=67(y1), r2=164(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=20(x), r1=56(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta line from (74, 67) to (164, 244).
; PLAN: r0=74(x1), r1=67(y1), r2=164(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 67
LDI r2, 164
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (20, 56).
; PLAN: r0=20(x), r1=56(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 56
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
