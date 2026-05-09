; DESCRIPTION: Composite: . Then Draws a cyan line from (173, 25) to (192, 48). Then Sets a single cyan pixel at (69, 197).
; PLAN: r0=173(x1), r1=25(y1), r2=192(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=69(x), r1=197(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan line from (173, 25) to (192, 48).
; PLAN: r0=173(x1), r1=25(y1), r2=192(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 25
LDI r2, 192
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (69, 197).
; PLAN: r0=69(x), r1=197(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 197
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
