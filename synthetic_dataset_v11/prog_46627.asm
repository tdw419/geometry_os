; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (140, 192) spanning 55 by 15 pixels. Then Places a yellow circle of radius 65 at center (164, 184).
; PLAN: r0=140(x), r1=192(y), r2=55(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=164(x), r1=184(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a cyan rectangular region at (140, 192) spanning 55 by 15 pixels.
; PLAN: r0=140(x), r1=192(y), r2=55(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 192
LDI r2, 55
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 65 at center (164, 184).
; PLAN: r0=164(x), r1=184(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 184
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
