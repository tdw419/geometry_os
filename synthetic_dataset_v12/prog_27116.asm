; DESCRIPTION: Composite: Places a blue circle of radius 80 at center (180, 162) then Draws a magenta line from (416, 238) to (320, 252).
; PLAN: r0=180(x), r1=162(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=416(x1), r6=238(y1), r7=320(x2), r8=252(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 180
LDI r1, 162
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 416
LDI r6, 238
LDI r7, 320
LDI r8, 252
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
