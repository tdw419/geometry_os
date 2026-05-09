; DESCRIPTION: Composite: . Then Places a magenta dot at position (128, 108). Then Draws a magenta line from (20, 172) to (113, 46).
; PLAN: r0=128(x), r1=108(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=20(x1), r1=172(y1), r2=113(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (128, 108).
; PLAN: r0=128(x), r1=108(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 108
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta line from (20, 172) to (113, 46).
; PLAN: r0=20(x1), r1=172(y1), r2=113(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 172
LDI r2, 113
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
