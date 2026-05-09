; DESCRIPTION: Composite: . Then Renders a cyan line between points (203, 188) and (42, 146). Then Sets a single black pixel at (11, 69).
; PLAN: r0=203(x1), r1=188(y1), r2=42(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=11(x), r1=69(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan line between points (203, 188) and (42, 146).
; PLAN: r0=203(x1), r1=188(y1), r2=42(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 188
LDI r2, 42
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (11, 69).
; PLAN: r0=11(x), r1=69(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 11
LDI r1, 69
LDI r2, 0x000000
PSET r0, r1, r2
HALT
