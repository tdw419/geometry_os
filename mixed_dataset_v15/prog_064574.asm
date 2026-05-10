; DESCRIPTION: Renders a cyan line segment connecting (140, 23) to (265, 21).
; PLAN: r0=140(x1), r1=23(y1), r2=265(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 23
LDI r2, 265
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
