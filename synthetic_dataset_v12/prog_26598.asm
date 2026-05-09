; DESCRIPTION: Draws a yellow line from (284, 212) to (392, 154).
; PLAN: r0=284(x1), r1=212(y1), r2=392(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 212
LDI r2, 392
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
