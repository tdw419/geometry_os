; DESCRIPTION: Draws a cyan line from (209, 14) to (431, 36).
; PLAN: r0=209(x1), r1=14(y1), r2=431(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 14
LDI r2, 431
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
