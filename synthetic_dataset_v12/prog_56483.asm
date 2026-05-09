; DESCRIPTION: Composite: Places a blue 28x109 rectangle at position (1, 57) then Places a blue line segment connecting (485, 204) to (38, 150).
; PLAN: r0=1(x), r1=57(y), r2=28(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=485(x1), r6=204(y1), r7=38(x2), r8=150(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 1
LDI r1, 57
LDI r2, 28
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 204
LDI r7, 38
LDI r8, 150
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
