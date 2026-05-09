; DESCRIPTION: Draws a cyan line from (14, 10) to (107, 255).
; PLAN: r0=14(x1), r1=10(y1), r2=107(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 10
LDI r2, 107
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
