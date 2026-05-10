; DESCRIPTION: Composite: Renders a white line between points (487, 201) and (8, 119) then Places a magenta 62x76 rectangle at position (371, 65).
; PLAN: r0=487(x1), r1=201(y1), r2=8(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=65(y), r7=62(width), r8=76(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 487
LDI r1, 201
LDI r2, 8
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 65
LDI r7, 62
LDI r8, 76
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
