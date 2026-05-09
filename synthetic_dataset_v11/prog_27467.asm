; DESCRIPTION: Renders a green line between points (108, 205) and (61, 183).
; PLAN: r0=108(x1), r1=205(y1), r2=61(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 205
LDI r2, 61
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
