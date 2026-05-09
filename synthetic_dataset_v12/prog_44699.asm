; DESCRIPTION: Places a green line segment connecting (440, 228) to (386, 70).
; PLAN: r0=440(x1), r1=228(y1), r2=386(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 228
LDI r2, 386
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
