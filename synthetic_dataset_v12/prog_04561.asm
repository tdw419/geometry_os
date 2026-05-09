; DESCRIPTION: Places a cyan line segment connecting (495, 80) to (487, 219).
; PLAN: r0=495(x1), r1=80(y1), r2=487(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 80
LDI r2, 487
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
