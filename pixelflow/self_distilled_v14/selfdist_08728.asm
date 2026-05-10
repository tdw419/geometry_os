; DESCRIPTION: Draws a cyan line from (152, 17) to (33, 165).
; PLAN: r0=152(x1), r1=17(y1), r2=33(x2), r3=165(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 17
LDI r2, 33
LDI r3, 165
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
