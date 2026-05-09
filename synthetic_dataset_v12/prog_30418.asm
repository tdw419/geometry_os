; DESCRIPTION: Places a green line segment connecting (126, 204) to (197, 150).
; PLAN: r0=126(x1), r1=204(y1), r2=197(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 204
LDI r2, 197
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
