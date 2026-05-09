; DESCRIPTION: Composite: . Then Sets a single green pixel at (176, 117). Then Places a cyan line segment connecting (67, 87) to (176, 177).
; PLAN: r0=176(x), r1=117(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=67(x1), r1=87(y1), r2=176(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (176, 117).
; PLAN: r0=176(x), r1=117(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 117
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a cyan line segment connecting (67, 87) to (176, 177).
; PLAN: r0=67(x1), r1=87(y1), r2=176(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 87
LDI r2, 176
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
