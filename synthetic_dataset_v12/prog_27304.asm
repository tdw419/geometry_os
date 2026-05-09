; DESCRIPTION: Places a cyan line segment connecting (358, 195) to (225, 253).
; PLAN: r0=358(x1), r1=195(y1), r2=225(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 195
LDI r2, 225
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
