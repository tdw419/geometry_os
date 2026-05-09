; DESCRIPTION: Composite: Renders a magenta line between points (167, 170) and (367, 249) then Places a black 119x72 rectangle at position (321, 117).
; PLAN: r0=167(x1), r1=170(y1), r2=367(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=321(x), r6=117(y), r7=119(width), r8=72(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 170
LDI r2, 367
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 117
LDI r7, 119
LDI r8, 72
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
