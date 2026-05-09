; DESCRIPTION: Places a white line segment connecting (151, 255) to (479, 221).
; PLAN: r0=151(x1), r1=255(y1), r2=479(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 255
LDI r2, 479
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
