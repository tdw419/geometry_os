; DESCRIPTION: Composite: Draws a cyan line from (130, 193) to (117, 210) then Draws a white rectangle at (422, 181) with width 36 and height 31.
; PLAN: r0=130(x1), r1=193(y1), r2=117(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=422(x), r6=181(y), r7=36(width), r8=31(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 193
LDI r2, 117
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 181
LDI r7, 36
LDI r8, 31
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
