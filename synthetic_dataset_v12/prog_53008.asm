; DESCRIPTION: Places a green line segment connecting (387, 197) to (502, 10).
; PLAN: r0=387(x1), r1=197(y1), r2=502(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 197
LDI r2, 502
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
