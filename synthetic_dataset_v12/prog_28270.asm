; DESCRIPTION: Places a cyan line segment connecting (433, 28) to (202, 255).
; PLAN: r0=433(x1), r1=28(y1), r2=202(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 28
LDI r2, 202
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
