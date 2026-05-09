; DESCRIPTION: Composite: Draws a green line from (330, 159) to (209, 35) then Creates a cyan rectangular region at (363, 153) spanning 54 by 91 pixels.
; PLAN: r0=330(x1), r1=159(y1), r2=209(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=153(y), r7=54(width), r8=91(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 330
LDI r1, 159
LDI r2, 209
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 153
LDI r7, 54
LDI r8, 91
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
