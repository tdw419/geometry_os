; DESCRIPTION: Places a cyan line segment connecting (173, 60) to (52, 55).
; PLAN: r0=173(x1), r1=60(y1), r2=52(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 60
LDI r2, 52
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
