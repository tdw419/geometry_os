; DESCRIPTION: Composite: . Then Sets a single green pixel at (180, 8). Then Draws a green line from (137, 166) to (48, 117).
; PLAN: r0=180(x), r1=8(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=137(x1), r1=166(y1), r2=48(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (180, 8).
; PLAN: r0=180(x), r1=8(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 8
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a green line from (137, 166) to (48, 117).
; PLAN: r0=137(x1), r1=166(y1), r2=48(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 166
LDI r2, 48
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
