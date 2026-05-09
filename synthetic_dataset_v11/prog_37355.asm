; DESCRIPTION: Composite: . Then Sets a single green pixel at (100, 41). Then Renders a red line between points (206, 117) and (242, 204).
; PLAN: r0=100(x), r1=41(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=206(x1), r1=117(y1), r2=242(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (100, 41).
; PLAN: r0=100(x), r1=41(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 100
LDI r1, 41
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a red line between points (206, 117) and (242, 204).
; PLAN: r0=206(x1), r1=117(y1), r2=242(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 117
LDI r2, 242
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
