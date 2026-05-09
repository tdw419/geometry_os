; DESCRIPTION: Composite: . Then Places a white circle of radius 19 at center (40, 79). Then Creates a cyan rectangular region at (84, 34) spanning 97 by 48 pixels.
; PLAN: r0=40(x), r1=79(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=84(x), r1=34(y), r2=97(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 19 at center (40, 79).
; PLAN: r0=40(x), r1=79(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 79
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a cyan rectangular region at (84, 34) spanning 97 by 48 pixels.
; PLAN: r0=84(x), r1=34(y), r2=97(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 34
LDI r2, 97
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
