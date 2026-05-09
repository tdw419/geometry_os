; DESCRIPTION: Composite: Places a orange 98x59 rectangle at position (353, 194) then Draws a orange line from (511, 112) to (4, 171).
; PLAN: r0=353(x), r1=194(y), r2=98(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=511(x1), r6=112(y1), r7=4(x2), r8=171(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 353
LDI r1, 194
LDI r2, 98
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 112
LDI r7, 4
LDI r8, 171
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
