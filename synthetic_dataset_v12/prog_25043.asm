; DESCRIPTION: Places a magenta line segment connecting (223, 46) to (284, 187).
; PLAN: r0=223(x1), r1=46(y1), r2=284(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 46
LDI r2, 284
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
