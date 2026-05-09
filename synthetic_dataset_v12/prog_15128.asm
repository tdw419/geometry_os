; DESCRIPTION: Draws a white line from (228, 46) to (33, 169).
; PLAN: r0=228(x1), r1=46(y1), r2=33(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 46
LDI r2, 33
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
