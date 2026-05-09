; DESCRIPTION: Composite: . Then Draws a magenta line from (59, 107) to (160, 26). Then Places a blue dot at position (63, 151).
; PLAN: r0=59(x1), r1=107(y1), r2=160(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=63(x), r1=151(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta line from (59, 107) to (160, 26).
; PLAN: r0=59(x1), r1=107(y1), r2=160(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 107
LDI r2, 160
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (63, 151).
; PLAN: r0=63(x), r1=151(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 151
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
