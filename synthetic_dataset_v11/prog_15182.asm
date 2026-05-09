; DESCRIPTION: Places a yellow line segment connecting (217, 221) to (178, 167).
; PLAN: r0=217(x1), r1=221(y1), r2=178(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 221
LDI r2, 178
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
