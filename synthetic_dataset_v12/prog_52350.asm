; DESCRIPTION: Places a white line segment connecting (234, 228) to (295, 180).
; PLAN: r0=234(x1), r1=228(y1), r2=295(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 228
LDI r2, 295
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
