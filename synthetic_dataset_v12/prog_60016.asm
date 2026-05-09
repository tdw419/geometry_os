; DESCRIPTION: Places a cyan line segment connecting (387, 166) to (453, 206).
; PLAN: r0=387(x1), r1=166(y1), r2=453(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 166
LDI r2, 453
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
