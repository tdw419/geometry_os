; DESCRIPTION: Renders a white line between points (171, 207) and (230, 187).
; PLAN: r0=171(x1), r1=207(y1), r2=230(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 207
LDI r2, 230
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
