; DESCRIPTION: Renders a cyan line between points (419, 245) and (331, 213).
; PLAN: r0=419(x1), r1=245(y1), r2=331(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 245
LDI r2, 331
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
