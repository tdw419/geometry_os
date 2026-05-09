; DESCRIPTION: Draws a cyan line from (402, 212) to (481, 152).
; PLAN: r0=402(x1), r1=212(y1), r2=481(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 212
LDI r2, 481
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
