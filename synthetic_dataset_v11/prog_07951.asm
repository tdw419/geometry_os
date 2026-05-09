; DESCRIPTION: Composite: . Then Sets a single green pixel at (229, 42). Then Renders a cyan line between points (86, 223) and (172, 39).
; PLAN: r0=229(x), r1=42(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=86(x1), r1=223(y1), r2=172(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (229, 42).
; PLAN: r0=229(x), r1=42(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 42
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan line between points (86, 223) and (172, 39).
; PLAN: r0=86(x1), r1=223(y1), r2=172(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 223
LDI r2, 172
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
