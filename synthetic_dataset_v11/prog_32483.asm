; DESCRIPTION: Composite: . Then Renders a purple disk with center (160, 120) and radius 41. Then Creates a cyan rectangular region at (91, 104) spanning 116 by 22 pixels.
; PLAN: r0=160(x), r1=120(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=91(x), r1=104(y), r2=116(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (160, 120) and radius 41.
; PLAN: r0=160(x), r1=120(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 120
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a cyan rectangular region at (91, 104) spanning 116 by 22 pixels.
; PLAN: r0=91(x), r1=104(y), r2=116(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 104
LDI r2, 116
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
