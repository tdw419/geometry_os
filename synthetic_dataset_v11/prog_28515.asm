; DESCRIPTION: Composite: . Then Places a red line segment connecting (212, 0) to (210, 97). Then Sets a single cyan pixel at (127, 52).
; PLAN: r0=212(x1), r1=0(y1), r2=210(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=127(x), r1=52(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red line segment connecting (212, 0) to (210, 97).
; PLAN: r0=212(x1), r1=0(y1), r2=210(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 0
LDI r2, 210
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (127, 52).
; PLAN: r0=127(x), r1=52(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 127
LDI r1, 52
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
