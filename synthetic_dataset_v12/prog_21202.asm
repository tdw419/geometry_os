; DESCRIPTION: Places a cyan line segment connecting (354, 197) to (95, 250).
; PLAN: r0=354(x1), r1=197(y1), r2=95(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 197
LDI r2, 95
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
