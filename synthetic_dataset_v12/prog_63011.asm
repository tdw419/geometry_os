; DESCRIPTION: Composite: Places a red 46x25 rectangle at position (164, 97) then Renders a green line between points (273, 219) and (235, 161).
; PLAN: r0=164(x), r1=97(y), r2=46(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=273(x1), r6=219(y1), r7=235(x2), r8=161(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 97
LDI r2, 46
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 219
LDI r7, 235
LDI r8, 161
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
