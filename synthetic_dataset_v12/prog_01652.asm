; DESCRIPTION: Places a white line segment connecting (157, 228) to (482, 18).
; PLAN: r0=157(x1), r1=228(y1), r2=482(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 228
LDI r2, 482
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
