; DESCRIPTION: Places a cyan line segment connecting (329, 121) to (105, 103).
; PLAN: r0=329(x1), r1=121(y1), r2=105(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 121
LDI r2, 105
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
