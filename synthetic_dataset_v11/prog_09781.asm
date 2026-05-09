; DESCRIPTION: Draws a white line from (39, 159) to (244, 174).
; PLAN: r0=39(x1), r1=159(y1), r2=244(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 159
LDI r2, 244
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
