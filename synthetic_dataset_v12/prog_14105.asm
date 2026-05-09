; DESCRIPTION: Renders a cyan line between points (499, 77) and (31, 27).
; PLAN: r0=499(x1), r1=77(y1), r2=31(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 77
LDI r2, 31
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
