; DESCRIPTION: Renders a cyan line between points (4, 255) and (374, 117).
; PLAN: r0=4(x1), r1=255(y1), r2=374(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 255
LDI r2, 374
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
