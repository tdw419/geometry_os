; DESCRIPTION: Renders a cyan line between points (59, 205) and (337, 54).
; PLAN: r0=59(x1), r1=205(y1), r2=337(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 205
LDI r2, 337
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
