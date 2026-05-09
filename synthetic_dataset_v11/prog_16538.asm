; DESCRIPTION: Composite: . Then Places a white dot at position (212, 97). Then Places a cyan line segment connecting (187, 27) to (167, 7).
; PLAN: r0=212(x), r1=97(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=187(x1), r1=27(y1), r2=167(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (212, 97).
; PLAN: r0=212(x), r1=97(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 97
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a cyan line segment connecting (187, 27) to (167, 7).
; PLAN: r0=187(x1), r1=27(y1), r2=167(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 27
LDI r2, 167
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
