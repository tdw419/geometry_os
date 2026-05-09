; DESCRIPTION: Composite: Renders a green line between points (133, 93) and (487, 116) then Renders a white box of size 85x97 starting at (71, 68).
; PLAN: r0=133(x1), r1=93(y1), r2=487(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=68(y), r7=85(width), r8=97(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 93
LDI r2, 487
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 68
LDI r7, 85
LDI r8, 97
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
