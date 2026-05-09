; DESCRIPTION: Places a cyan line segment connecting (113, 251) to (416, 186).
; PLAN: r0=113(x1), r1=251(y1), r2=416(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 251
LDI r2, 416
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
