; DESCRIPTION: Renders a cyan line between points (247, 56) and (171, 44).
; PLAN: r0=247(x1), r1=56(y1), r2=171(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 56
LDI r2, 171
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
