; DESCRIPTION: Draws a green line from (415, 148) to (171, 0).
; PLAN: r0=415(x1), r1=148(y1), r2=171(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 148
LDI r2, 171
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
