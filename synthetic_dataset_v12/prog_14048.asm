; DESCRIPTION: Draws a white line from (171, 228) to (144, 70).
; PLAN: r0=171(x1), r1=228(y1), r2=144(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 228
LDI r2, 144
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
