; DESCRIPTION: Composite: . Then Renders a red line between points (77, 180) and (121, 135). Then Places a cyan circle of radius 65 at center (93, 98).
; PLAN: r0=77(x1), r1=180(y1), r2=121(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=93(x), r1=98(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red line between points (77, 180) and (121, 135).
; PLAN: r0=77(x1), r1=180(y1), r2=121(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 180
LDI r2, 121
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan circle of radius 65 at center (93, 98).
; PLAN: r0=93(x), r1=98(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 98
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
