; DESCRIPTION: Composite: . Then Creates a white rectangular region at (157, 184) spanning 71 by 70 pixels. Then Creates a cyan circular shape at (164, 160) with radius 74.
; PLAN: r0=157(x), r1=184(y), r2=71(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=164(x), r1=160(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a white rectangular region at (157, 184) spanning 71 by 70 pixels.
; PLAN: r0=157(x), r1=184(y), r2=71(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 184
LDI r2, 71
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (164, 160) with radius 74.
; PLAN: r0=164(x), r1=160(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 160
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
