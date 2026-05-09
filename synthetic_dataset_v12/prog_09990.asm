; DESCRIPTION: Draws a green line from (284, 69) to (57, 49).
; PLAN: r0=284(x1), r1=69(y1), r2=57(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 69
LDI r2, 57
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
