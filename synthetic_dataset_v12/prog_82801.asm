; DESCRIPTION: Places a magenta line segment connecting (386, 239) to (209, 188).
; PLAN: r0=386(x1), r1=239(y1), r2=209(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 239
LDI r2, 209
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
