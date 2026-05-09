; DESCRIPTION: Renders a cyan line between points (23, 255) and (134, 152).
; PLAN: r0=23(x1), r1=255(y1), r2=134(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 255
LDI r2, 134
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
