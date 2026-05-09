; DESCRIPTION: Composite: . Then Renders a cyan line between points (214, 55) and (100, 204). Then Sets a single magenta pixel at (41, 142).
; PLAN: r0=214(x1), r1=55(y1), r2=100(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=41(x), r1=142(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan line between points (214, 55) and (100, 204).
; PLAN: r0=214(x1), r1=55(y1), r2=100(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 55
LDI r2, 100
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (41, 142).
; PLAN: r0=41(x), r1=142(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 142
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
