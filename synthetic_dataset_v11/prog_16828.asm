; DESCRIPTION: Composite: . Then Creates a green rectangular region at (86, 154) spanning 24 by 60 pixels. Then Renders a cyan line between points (92, 30) and (59, 201).
; PLAN: r0=86(x), r1=154(y), r2=24(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=92(x1), r1=30(y1), r2=59(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a green rectangular region at (86, 154) spanning 24 by 60 pixels.
; PLAN: r0=86(x), r1=154(y), r2=24(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 154
LDI r2, 24
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan line between points (92, 30) and (59, 201).
; PLAN: r0=92(x1), r1=30(y1), r2=59(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 30
LDI r2, 59
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
