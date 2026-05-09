; DESCRIPTION: Places a cyan line segment connecting (38, 225) to (206, 215).
; PLAN: r0=38(x1), r1=225(y1), r2=206(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 225
LDI r2, 206
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
