; DESCRIPTION: Draws a cyan line from (280, 73) to (330, 4).
; PLAN: r0=280(x1), r1=73(y1), r2=330(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 73
LDI r2, 330
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
