; DESCRIPTION: Places a cyan line segment connecting (103, 113) to (144, 59).
; PLAN: r0=103(x1), r1=113(y1), r2=144(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 113
LDI r2, 144
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
