; DESCRIPTION: Places a white line segment connecting (146, 185) to (225, 113).
; PLAN: r0=146(x1), r1=185(y1), r2=225(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 185
LDI r2, 225
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
