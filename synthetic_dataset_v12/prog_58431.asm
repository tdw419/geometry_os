; DESCRIPTION: Draws a cyan line from (138, 112) to (371, 8).
; PLAN: r0=138(x1), r1=112(y1), r2=371(x2), r3=8(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 112
LDI r2, 371
LDI r3, 8
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
