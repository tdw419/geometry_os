; DESCRIPTION: Composite: Draws a cyan rectangle at (10, 148) with width 102 and height 10 then Draws a cyan line from (502, 240) to (346, 158).
; PLAN: r0=10(x), r1=148(y), r2=102(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=502(x1), r6=240(y1), r7=346(x2), r8=158(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 10
LDI r1, 148
LDI r2, 102
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 502
LDI r6, 240
LDI r7, 346
LDI r8, 158
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
