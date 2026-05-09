; DESCRIPTION: Places a red line segment connecting (236, 239) to (215, 113).
; PLAN: r0=236(x1), r1=239(y1), r2=215(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 239
LDI r2, 215
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
