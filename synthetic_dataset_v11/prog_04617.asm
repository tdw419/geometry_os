; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (95, 226). Then Places a white line segment connecting (173, 138) to (116, 197).
; PLAN: r0=95(x), r1=226(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=173(x1), r1=138(y1), r2=116(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (95, 226).
; PLAN: r0=95(x), r1=226(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 226
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a white line segment connecting (173, 138) to (116, 197).
; PLAN: r0=173(x1), r1=138(y1), r2=116(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 138
LDI r2, 116
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
