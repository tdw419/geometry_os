; DESCRIPTION: Places a cyan line segment connecting (103, 80) to (151, 215).
; PLAN: r0=103(x1), r1=80(y1), r2=151(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 80
LDI r2, 151
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
