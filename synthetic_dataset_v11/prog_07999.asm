; DESCRIPTION: Composite: . Then Renders a cyan line between points (129, 172) and (168, 59). Then Sets a single white pixel at (161, 84).
; PLAN: r0=129(x1), r1=172(y1), r2=168(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=161(x), r1=84(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan line between points (129, 172) and (168, 59).
; PLAN: r0=129(x1), r1=172(y1), r2=168(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 172
LDI r2, 168
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (161, 84).
; PLAN: r0=161(x), r1=84(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 84
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
