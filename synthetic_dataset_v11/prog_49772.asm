; DESCRIPTION: Places a cyan line segment connecting (173, 106) to (39, 79).
; PLAN: r0=173(x1), r1=106(y1), r2=39(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 106
LDI r2, 39
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
