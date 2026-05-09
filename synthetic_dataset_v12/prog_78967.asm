; DESCRIPTION: Draws a red line from (288, 172) to (446, 202).
; PLAN: r0=288(x1), r1=172(y1), r2=446(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 172
LDI r2, 446
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
