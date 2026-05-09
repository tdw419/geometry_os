; DESCRIPTION: Renders a cyan line between points (255, 68) and (40, 198).
; PLAN: r0=255(x1), r1=68(y1), r2=40(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 68
LDI r2, 40
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
