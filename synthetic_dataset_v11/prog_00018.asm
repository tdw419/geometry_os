; DESCRIPTION: Draws a cyan line from (113, 39) to (169, 196).
; PLAN: r0=113(x1), r1=39(y1), r2=169(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 39
LDI r2, 169
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
