; DESCRIPTION: Places a magenta line segment connecting (295, 97) to (162, 125).
; PLAN: r0=295(x1), r1=97(y1), r2=162(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 97
LDI r2, 162
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
