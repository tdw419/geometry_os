; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (36, 246). Then Renders a red line between points (111, 242) and (39, 113).
; PLAN: r0=36(x), r1=246(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=111(x1), r1=242(y1), r2=39(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (36, 246).
; PLAN: r0=36(x), r1=246(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 246
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a red line between points (111, 242) and (39, 113).
; PLAN: r0=111(x1), r1=242(y1), r2=39(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 242
LDI r2, 39
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
