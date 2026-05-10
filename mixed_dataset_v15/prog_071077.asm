; DESCRIPTION: Places a cyan line segment connecting (39, 47) to (199, 166).
; PLAN: r0=39(x1), r1=47(y1), r2=199(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 47
LDI r2, 199
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
