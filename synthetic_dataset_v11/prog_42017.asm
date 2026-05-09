; DESCRIPTION: Places a red line segment connecting (60, 213) to (229, 215).
; PLAN: r0=60(x1), r1=213(y1), r2=229(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 213
LDI r2, 229
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
