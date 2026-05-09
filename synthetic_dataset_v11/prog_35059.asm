; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (193, 70) spanning 55 by 71 pixels. Then Places a red circle of radius 63 at center (160, 104).
; PLAN: r0=193(x), r1=70(y), r2=55(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=160(x), r1=104(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a orange rectangular region at (193, 70) spanning 55 by 71 pixels.
; PLAN: r0=193(x), r1=70(y), r2=55(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 70
LDI r2, 55
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 63 at center (160, 104).
; PLAN: r0=160(x), r1=104(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 104
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
