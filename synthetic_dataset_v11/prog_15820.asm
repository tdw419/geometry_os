; DESCRIPTION: Composite: . Then Renders a white line between points (166, 87) and (43, 255). Then Places a orange dot at position (59, 1).
; PLAN: r0=166(x1), r1=87(y1), r2=43(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=59(x), r1=1(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white line between points (166, 87) and (43, 255).
; PLAN: r0=166(x1), r1=87(y1), r2=43(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 87
LDI r2, 43
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (59, 1).
; PLAN: r0=59(x), r1=1(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 59
LDI r1, 1
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
