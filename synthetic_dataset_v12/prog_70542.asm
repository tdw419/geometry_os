; DESCRIPTION: Places a cyan line segment connecting (365, 87) to (321, 59).
; PLAN: r0=365(x1), r1=87(y1), r2=321(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 87
LDI r2, 321
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
