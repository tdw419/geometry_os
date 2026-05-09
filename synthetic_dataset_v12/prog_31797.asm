; DESCRIPTION: Places a magenta line segment connecting (352, 219) to (254, 126).
; PLAN: r0=352(x1), r1=219(y1), r2=254(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 219
LDI r2, 254
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
