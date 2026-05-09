; DESCRIPTION: Composite: . Then Draws a purple line from (140, 67) to (57, 95). Then Places a green dot at position (62, 166).
; PLAN: r0=140(x1), r1=67(y1), r2=57(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=62(x), r1=166(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple line from (140, 67) to (57, 95).
; PLAN: r0=140(x1), r1=67(y1), r2=57(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 67
LDI r2, 57
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (62, 166).
; PLAN: r0=62(x), r1=166(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 166
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
