; DESCRIPTION: Places a green line segment connecting (367, 59) to (340, 113).
; PLAN: r0=367(x1), r1=59(y1), r2=340(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 59
LDI r2, 340
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
