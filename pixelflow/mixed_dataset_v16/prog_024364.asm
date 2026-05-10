; DESCRIPTION: Places a cyan line segment connecting (255, 129) to (477, 179).
; PLAN: r0=255(x1), r1=129(y1), r2=477(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 129
LDI r2, 477
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
