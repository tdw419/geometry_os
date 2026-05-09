; DESCRIPTION: Composite: . Then Places a white 42x109 rectangle at position (47, 63). Then Renders a white line between points (97, 192) and (112, 37).
; PLAN: r0=47(x), r1=63(y), r2=42(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=97(x1), r1=192(y1), r2=112(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white 42x109 rectangle at position (47, 63).
; PLAN: r0=47(x), r1=63(y), r2=42(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 63
LDI r2, 42
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white line between points (97, 192) and (112, 37).
; PLAN: r0=97(x1), r1=192(y1), r2=112(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 192
LDI r2, 112
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
