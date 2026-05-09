; DESCRIPTION: Places a cyan line segment connecting (385, 248) to (294, 51).
; PLAN: r0=385(x1), r1=248(y1), r2=294(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 248
LDI r2, 294
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
