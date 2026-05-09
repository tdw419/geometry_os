; DESCRIPTION: Renders a cyan line between points (285, 54) and (283, 27).
; PLAN: r0=285(x1), r1=54(y1), r2=283(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 54
LDI r2, 283
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
