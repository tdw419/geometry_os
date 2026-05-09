; DESCRIPTION: Draws a red line from (446, 142) to (263, 124).
; PLAN: r0=446(x1), r1=142(y1), r2=263(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 142
LDI r2, 263
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
