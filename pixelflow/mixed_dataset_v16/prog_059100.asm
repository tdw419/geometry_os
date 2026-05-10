; DESCRIPTION: Places a cyan line segment connecting (482, 58) to (255, 223).
; PLAN: r0=482(x1), r1=58(y1), r2=255(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 58
LDI r2, 255
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
