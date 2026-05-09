; DESCRIPTION: Composite: Places a green 77x27 rectangle at position (178, 13) then Draws a green line from (507, 25) to (417, 247).
; PLAN: r0=178(x), r1=13(y), r2=77(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=507(x1), r6=25(y1), r7=417(x2), r8=247(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 13
LDI r2, 77
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 507
LDI r6, 25
LDI r7, 417
LDI r8, 247
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
