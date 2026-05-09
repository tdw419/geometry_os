; DESCRIPTION: Draws a cyan line from (433, 59) to (43, 88).
; PLAN: r0=433(x1), r1=59(y1), r2=43(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 59
LDI r2, 43
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
