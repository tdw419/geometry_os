; DESCRIPTION: Places a cyan line segment connecting (263, 103) to (209, 66).
; PLAN: r0=263(x1), r1=103(y1), r2=209(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 103
LDI r2, 209
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
