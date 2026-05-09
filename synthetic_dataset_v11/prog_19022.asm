; DESCRIPTION: Composite: . Then Renders a cyan line between points (100, 207) and (236, 152). Then Sets a single black pixel at (56, 117).
; PLAN: r0=100(x1), r1=207(y1), r2=236(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=56(x), r1=117(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan line between points (100, 207) and (236, 152).
; PLAN: r0=100(x1), r1=207(y1), r2=236(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 207
LDI r2, 236
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (56, 117).
; PLAN: r0=56(x), r1=117(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 117
LDI r2, 0x000000
PSET r0, r1, r2
HALT
