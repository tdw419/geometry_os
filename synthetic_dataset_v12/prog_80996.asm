; DESCRIPTION: Places a cyan line segment connecting (437, 55) to (207, 255).
; PLAN: r0=437(x1), r1=55(y1), r2=207(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 55
LDI r2, 207
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
