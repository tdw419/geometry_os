; DESCRIPTION: Places a green line segment connecting (197, 111) to (137, 213).
; PLAN: r0=197(x1), r1=111(y1), r2=137(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 111
LDI r2, 137
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
