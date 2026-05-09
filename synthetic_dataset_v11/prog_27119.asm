; DESCRIPTION: Composite: . Then Renders a cyan line between points (221, 122) and (13, 42). Then Sets a single cyan pixel at (62, 86).
; PLAN: r0=221(x1), r1=122(y1), r2=13(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=62(x), r1=86(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan line between points (221, 122) and (13, 42).
; PLAN: r0=221(x1), r1=122(y1), r2=13(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 122
LDI r2, 13
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (62, 86).
; PLAN: r0=62(x), r1=86(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 86
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
