; DESCRIPTION: Renders a cyan line between points (285, 90) and (27, 187).
; PLAN: r0=285(x1), r1=90(y1), r2=27(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 90
LDI r2, 27
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
