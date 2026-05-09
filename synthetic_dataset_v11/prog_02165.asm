; DESCRIPTION: Composite: . Then Renders a magenta line between points (148, 129) and (253, 170). Then Places a green 119x50 rectangle at position (6, 109).
; PLAN: r0=148(x1), r1=129(y1), r2=253(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=6(x), r1=109(y), r2=119(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta line between points (148, 129) and (253, 170).
; PLAN: r0=148(x1), r1=129(y1), r2=253(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 129
LDI r2, 253
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green 119x50 rectangle at position (6, 109).
; PLAN: r0=6(x), r1=109(y), r2=119(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 109
LDI r2, 119
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
