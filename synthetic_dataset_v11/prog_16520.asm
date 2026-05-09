; DESCRIPTION: Places a cyan line segment connecting (255, 48) to (30, 71).
; PLAN: r0=255(x1), r1=48(y1), r2=30(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 48
LDI r2, 30
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
