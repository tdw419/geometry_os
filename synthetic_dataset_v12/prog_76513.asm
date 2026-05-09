; DESCRIPTION: Draws a green line from (480, 69) to (284, 75).
; PLAN: r0=480(x1), r1=69(y1), r2=284(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 69
LDI r2, 284
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
