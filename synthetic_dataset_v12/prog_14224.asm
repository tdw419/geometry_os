; DESCRIPTION: Draws a red line from (39, 48) to (494, 223).
; PLAN: r0=39(x1), r1=48(y1), r2=494(x2), r3=223(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 48
LDI r2, 494
LDI r3, 223
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
