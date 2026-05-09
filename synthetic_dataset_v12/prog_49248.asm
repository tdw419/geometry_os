; DESCRIPTION: Renders a cyan line between points (382, 172) and (167, 91).
; PLAN: r0=382(x1), r1=172(y1), r2=167(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 172
LDI r2, 167
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
