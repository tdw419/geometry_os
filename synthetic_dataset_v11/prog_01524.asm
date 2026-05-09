; DESCRIPTION: Renders a cyan line between points (9, 162) and (255, 204).
; PLAN: r0=9(x1), r1=162(y1), r2=255(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 162
LDI r2, 255
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
