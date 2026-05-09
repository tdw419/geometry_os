; DESCRIPTION: Places a white line segment connecting (284, 149) to (167, 125).
; PLAN: r0=284(x1), r1=149(y1), r2=167(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 149
LDI r2, 167
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
