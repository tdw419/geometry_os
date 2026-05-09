; DESCRIPTION: Composite: . Then Places a magenta dot at position (66, 49). Then Draws a black line from (156, 224) to (218, 47).
; PLAN: r0=66(x), r1=49(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=156(x1), r1=224(y1), r2=218(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (66, 49).
; PLAN: r0=66(x), r1=49(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 49
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a black line from (156, 224) to (218, 47).
; PLAN: r0=156(x1), r1=224(y1), r2=218(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 224
LDI r2, 218
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
