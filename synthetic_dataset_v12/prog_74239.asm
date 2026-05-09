; DESCRIPTION: Places a white line segment connecting (360, 197) to (394, 182).
; PLAN: r0=360(x1), r1=197(y1), r2=394(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 197
LDI r2, 394
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
