; DESCRIPTION: Composite: . Then Places a cyan dot at position (172, 138). Then Places a red line segment connecting (178, 74) to (214, 48).
; PLAN: r0=172(x), r1=138(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=178(x1), r1=74(y1), r2=214(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (172, 138).
; PLAN: r0=172(x), r1=138(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 138
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a red line segment connecting (178, 74) to (214, 48).
; PLAN: r0=178(x1), r1=74(y1), r2=214(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 74
LDI r2, 214
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
