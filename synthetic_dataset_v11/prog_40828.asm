; DESCRIPTION: Composite: . Then Draws a white line from (222, 1) to (136, 213). Then Sets a single green pixel at (34, 173).
; PLAN: r0=222(x1), r1=1(y1), r2=136(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=34(x), r1=173(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (222, 1) to (136, 213).
; PLAN: r0=222(x1), r1=1(y1), r2=136(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 1
LDI r2, 136
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (34, 173).
; PLAN: r0=34(x), r1=173(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 34
LDI r1, 173
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
