; DESCRIPTION: Renders a cyan line between points (10, 59) and (268, 233).
; PLAN: r0=10(x1), r1=59(y1), r2=268(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 59
LDI r2, 268
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
