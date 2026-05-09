; DESCRIPTION: Places a magenta line segment connecting (263, 221) to (252, 195).
; PLAN: r0=263(x1), r1=221(y1), r2=252(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 221
LDI r2, 252
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
