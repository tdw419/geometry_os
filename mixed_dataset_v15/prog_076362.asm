; DESCRIPTION: Places a cyan line segment connecting (329, 188) to (174, 204).
; PLAN: r0=329(x1), r1=188(y1), r2=174(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 188
LDI r2, 174
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
