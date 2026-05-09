; DESCRIPTION: Composite: . Then Places a red line segment connecting (187, 149) to (102, 221). Then Places a cyan dot at position (182, 6).
; PLAN: r0=187(x1), r1=149(y1), r2=102(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=182(x), r1=6(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red line segment connecting (187, 149) to (102, 221).
; PLAN: r0=187(x1), r1=149(y1), r2=102(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 149
LDI r2, 102
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (182, 6).
; PLAN: r0=182(x), r1=6(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 182
LDI r1, 6
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
