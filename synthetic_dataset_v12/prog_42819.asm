; DESCRIPTION: Renders a cyan line between points (408, 5) and (247, 45).
; PLAN: r0=408(x1), r1=5(y1), r2=247(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 5
LDI r2, 247
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
