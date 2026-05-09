; DESCRIPTION: Composite: . Then Places a orange circle of radius 63 at center (187, 177). Then Creates a blue rectangular region at (178, 143) spanning 71 by 33 pixels.
; PLAN: r0=187(x), r1=177(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=178(x), r1=143(y), r2=71(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 63 at center (187, 177).
; PLAN: r0=187(x), r1=177(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 177
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a blue rectangular region at (178, 143) spanning 71 by 33 pixels.
; PLAN: r0=178(x), r1=143(y), r2=71(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 143
LDI r2, 71
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
