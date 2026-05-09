; DESCRIPTION: Composite: . Then Places a red dot at position (183, 140). Then Places a cyan line segment connecting (42, 38) to (229, 228).
; PLAN: r0=183(x), r1=140(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=42(x1), r1=38(y1), r2=229(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (183, 140).
; PLAN: r0=183(x), r1=140(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 183
LDI r1, 140
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a cyan line segment connecting (42, 38) to (229, 228).
; PLAN: r0=42(x1), r1=38(y1), r2=229(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 38
LDI r2, 229
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
