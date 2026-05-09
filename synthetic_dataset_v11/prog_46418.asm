; DESCRIPTION: Draws a white line from (246, 244) to (59, 171).
; PLAN: r0=246(x1), r1=244(y1), r2=59(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 244
LDI r2, 59
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
