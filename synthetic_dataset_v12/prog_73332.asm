; DESCRIPTION: Places a cyan line segment connecting (319, 215) to (373, 220).
; PLAN: r0=319(x1), r1=215(y1), r2=373(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 215
LDI r2, 373
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
