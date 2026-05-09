; DESCRIPTION: Renders a cyan line between points (36, 111) and (486, 63).
; PLAN: r0=36(x1), r1=111(y1), r2=486(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 111
LDI r2, 486
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
