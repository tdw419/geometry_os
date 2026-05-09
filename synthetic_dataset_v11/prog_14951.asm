; DESCRIPTION: Draws a cyan line from (103, 79) to (90, 13).
; PLAN: r0=103(x1), r1=79(y1), r2=90(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 79
LDI r2, 90
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
