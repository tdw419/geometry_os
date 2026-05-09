; DESCRIPTION: Places a red line segment connecting (243, 116) to (346, 173).
; PLAN: r0=243(x1), r1=116(y1), r2=346(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 116
LDI r2, 346
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
