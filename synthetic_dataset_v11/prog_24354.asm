; DESCRIPTION: Places a red line segment connecting (218, 235) to (202, 113).
; PLAN: r0=218(x1), r1=235(y1), r2=202(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 235
LDI r2, 202
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
