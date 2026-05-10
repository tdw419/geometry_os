; DESCRIPTION: Composite: Places a red circle of radius 70 at center (236, 84) then Draws a blue line from (38, 173) to (79, 117).
; PLAN: r0=236(x), r1=84(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x1), r6=173(y1), r7=79(x2), r8=117(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 84
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 173
LDI r7, 79
LDI r8, 117
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
