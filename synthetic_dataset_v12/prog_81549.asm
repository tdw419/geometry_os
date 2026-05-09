; DESCRIPTION: Places a magenta line segment connecting (309, 197) to (439, 234).
; PLAN: r0=309(x1), r1=197(y1), r2=439(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 197
LDI r2, 439
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
