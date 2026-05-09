; DESCRIPTION: Composite: . Then Draws a cyan line from (113, 13) to (238, 151). Then Sets a single purple pixel at (250, 177).
; PLAN: r0=113(x1), r1=13(y1), r2=238(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=250(x), r1=177(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan line from (113, 13) to (238, 151).
; PLAN: r0=113(x1), r1=13(y1), r2=238(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 13
LDI r2, 238
LDI r3, 151
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (250, 177).
; PLAN: r0=250(x), r1=177(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 250
LDI r1, 177
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
