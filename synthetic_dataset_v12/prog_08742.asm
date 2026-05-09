; DESCRIPTION: Places a white line segment connecting (284, 26) to (202, 71).
; PLAN: r0=284(x1), r1=26(y1), r2=202(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 26
LDI r2, 202
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
