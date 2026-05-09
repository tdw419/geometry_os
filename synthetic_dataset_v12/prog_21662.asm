; DESCRIPTION: Places a cyan line segment connecting (360, 79) to (368, 28).
; PLAN: r0=360(x1), r1=79(y1), r2=368(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 79
LDI r2, 368
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
