; DESCRIPTION: Composite: Places a green line segment connecting (405, 97) to (400, 202) then Places a orange 39x36 rectangle at position (146, 100).
; PLAN: r0=405(x1), r1=97(y1), r2=400(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=100(y), r7=39(width), r8=36(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 97
LDI r2, 400
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 100
LDI r7, 39
LDI r8, 36
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
