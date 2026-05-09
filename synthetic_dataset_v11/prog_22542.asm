; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (44, 3) spanning 84 by 104 pixels. Then Renders a cyan line between points (253, 29) and (2, 60).
; PLAN: r0=44(x), r1=3(y), r2=84(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=253(x1), r1=29(y1), r2=2(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta rectangular region at (44, 3) spanning 84 by 104 pixels.
; PLAN: r0=44(x), r1=3(y), r2=84(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 3
LDI r2, 84
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan line between points (253, 29) and (2, 60).
; PLAN: r0=253(x1), r1=29(y1), r2=2(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 29
LDI r2, 2
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
