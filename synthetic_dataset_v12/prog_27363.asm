; DESCRIPTION: Renders a cyan line between points (193, 227) and (294, 183).
; PLAN: r0=193(x1), r1=227(y1), r2=294(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 227
LDI r2, 294
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
