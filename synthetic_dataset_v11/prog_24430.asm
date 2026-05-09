; DESCRIPTION: Places a cyan line segment connecting (165, 134) to (103, 209).
; PLAN: r0=165(x1), r1=134(y1), r2=103(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 134
LDI r2, 103
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
