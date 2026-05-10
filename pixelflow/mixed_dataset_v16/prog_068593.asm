; DESCRIPTION: Renders a green line between points (401, 185) and (193, 111).
; PLAN: r0=401(x1), r1=185(y1), r2=193(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 185
LDI r2, 193
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
