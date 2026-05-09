; DESCRIPTION: Composite: Draws a white line from (398, 131) to (79, 239) then Creates a white rectangular region at (419, 155) spanning 76 by 87 pixels.
; PLAN: r0=398(x1), r1=131(y1), r2=79(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=419(x), r6=155(y), r7=76(width), r8=87(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 131
LDI r2, 79
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 155
LDI r7, 76
LDI r8, 87
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
