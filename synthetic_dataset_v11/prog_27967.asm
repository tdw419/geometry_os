; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (68, 44). Then Places a magenta line segment connecting (23, 230) to (213, 71).
; PLAN: r0=68(x), r1=44(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=23(x1), r1=230(y1), r2=213(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (68, 44).
; PLAN: r0=68(x), r1=44(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 44
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a magenta line segment connecting (23, 230) to (213, 71).
; PLAN: r0=23(x1), r1=230(y1), r2=213(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 230
LDI r2, 213
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
