; DESCRIPTION: Draws a cyan line from (25, 139) to (198, 29).
; PLAN: r0=25(x1), r1=139(y1), r2=198(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 139
LDI r2, 198
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
