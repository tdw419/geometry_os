; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (109, 120) spanning 34 by 117 pixels. Then Renders a black line between points (131, 192) and (61, 12).
; PLAN: r0=109(x), r1=120(y), r2=34(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=131(x1), r1=192(y1), r2=61(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange rectangular region at (109, 120) spanning 34 by 117 pixels.
; PLAN: r0=109(x), r1=120(y), r2=34(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 120
LDI r2, 34
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black line between points (131, 192) and (61, 12).
; PLAN: r0=131(x1), r1=192(y1), r2=61(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 192
LDI r2, 61
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
