; DESCRIPTION: Renders a green line between points (301, 205) and (425, 198).
; PLAN: r0=301(x1), r1=205(y1), r2=425(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 205
LDI r2, 425
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
