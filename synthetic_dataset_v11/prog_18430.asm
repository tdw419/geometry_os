; DESCRIPTION: Composite: . Then Places a cyan dot at position (126, 182). Then Places a orange line segment connecting (213, 24) to (213, 223).
; PLAN: r0=126(x), r1=182(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=213(x1), r1=24(y1), r2=213(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (126, 182).
; PLAN: r0=126(x), r1=182(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 182
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a orange line segment connecting (213, 24) to (213, 223).
; PLAN: r0=213(x1), r1=24(y1), r2=213(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 24
LDI r2, 213
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
