; DESCRIPTION: Renders a cyan line between points (59, 99) and (324, 91).
; PLAN: r0=59(x1), r1=99(y1), r2=324(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 99
LDI r2, 324
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
