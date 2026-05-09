; DESCRIPTION: Places a cyan line segment connecting (132, 173) to (125, 236).
; PLAN: r0=132(x1), r1=173(y1), r2=125(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 173
LDI r2, 125
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
