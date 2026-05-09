; DESCRIPTION: Draws a cyan line from (440, 255) to (248, 96).
; PLAN: r0=440(x1), r1=255(y1), r2=248(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 255
LDI r2, 248
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
