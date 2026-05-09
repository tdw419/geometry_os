; DESCRIPTION: Places a white line segment connecting (90, 38) to (479, 86).
; PLAN: r0=90(x1), r1=38(y1), r2=479(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 38
LDI r2, 479
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
