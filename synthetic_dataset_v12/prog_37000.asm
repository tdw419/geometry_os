; DESCRIPTION: Places a cyan line segment connecting (241, 247) to (173, 17).
; PLAN: r0=241(x1), r1=247(y1), r2=173(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 247
LDI r2, 173
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
