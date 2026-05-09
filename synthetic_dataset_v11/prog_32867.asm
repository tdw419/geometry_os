; DESCRIPTION: Composite: . Then Places a white line segment connecting (252, 239) to (238, 27). Then Places a red dot at position (188, 31).
; PLAN: r0=252(x1), r1=239(y1), r2=238(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=188(x), r1=31(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white line segment connecting (252, 239) to (238, 27).
; PLAN: r0=252(x1), r1=239(y1), r2=238(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 239
LDI r2, 238
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (188, 31).
; PLAN: r0=188(x), r1=31(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 31
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
