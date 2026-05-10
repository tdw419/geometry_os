; DESCRIPTION: Places a cyan line segment connecting (330, 207) to (173, 35).
; PLAN: r0=330(x1), r1=207(y1), r2=173(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 207
LDI r2, 173
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
