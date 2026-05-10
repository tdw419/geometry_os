; DESCRIPTION: Places a cyan line segment connecting (507, 113) to (255, 55).
; PLAN: r0=507(x1), r1=113(y1), r2=255(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 113
LDI r2, 255
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
