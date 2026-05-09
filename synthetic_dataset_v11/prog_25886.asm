; DESCRIPTION: Renders a cyan line between points (143, 247) and (254, 131).
; PLAN: r0=143(x1), r1=247(y1), r2=254(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 247
LDI r2, 254
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
