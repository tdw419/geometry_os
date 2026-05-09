; DESCRIPTION: Renders a cyan line between points (354, 84) and (86, 101).
; PLAN: r0=354(x1), r1=84(y1), r2=86(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 84
LDI r2, 86
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
