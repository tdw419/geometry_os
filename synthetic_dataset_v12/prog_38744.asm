; DESCRIPTION: Places a white line segment connecting (171, 106) to (180, 215).
; PLAN: r0=171(x1), r1=106(y1), r2=180(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 106
LDI r2, 180
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
