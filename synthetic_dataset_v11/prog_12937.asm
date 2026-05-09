; DESCRIPTION: Composite: . Then Places a red line segment connecting (61, 5) to (252, 126). Then Places a cyan circle of radius 57 at center (180, 171).
; PLAN: r0=61(x1), r1=5(y1), r2=252(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=180(x), r1=171(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red line segment connecting (61, 5) to (252, 126).
; PLAN: r0=61(x1), r1=5(y1), r2=252(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 5
LDI r2, 252
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan circle of radius 57 at center (180, 171).
; PLAN: r0=180(x), r1=171(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 171
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
