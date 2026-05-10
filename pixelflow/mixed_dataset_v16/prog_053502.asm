; DESCRIPTION: Draws a cyan line from (435, 255) to (207, 168).
; PLAN: r0=435(x1), r1=255(y1), r2=207(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 255
LDI r2, 207
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
