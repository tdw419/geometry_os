; DESCRIPTION: Renders a green line between points (231, 253) and (401, 75).
; PLAN: r0=231(x1), r1=253(y1), r2=401(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 253
LDI r2, 401
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
