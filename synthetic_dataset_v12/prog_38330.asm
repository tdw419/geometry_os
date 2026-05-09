; DESCRIPTION: Places a cyan line segment connecting (59, 4) to (465, 13).
; PLAN: r0=59(x1), r1=4(y1), r2=465(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 4
LDI r2, 465
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
