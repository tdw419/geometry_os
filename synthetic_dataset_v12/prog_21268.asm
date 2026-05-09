; DESCRIPTION: Places a cyan line segment connecting (413, 236) to (436, 113).
; PLAN: r0=413(x1), r1=236(y1), r2=436(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 236
LDI r2, 436
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
