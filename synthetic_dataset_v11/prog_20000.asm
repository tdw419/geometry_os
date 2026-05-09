; DESCRIPTION: Composite: . Then Places a cyan circle of radius 41 at center (193, 152). Then Creates a cyan rectangular region at (181, 94) spanning 63 by 12 pixels.
; PLAN: r0=193(x), r1=152(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=181(x), r1=94(y), r2=63(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 41 at center (193, 152).
; PLAN: r0=193(x), r1=152(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 152
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a cyan rectangular region at (181, 94) spanning 63 by 12 pixels.
; PLAN: r0=181(x), r1=94(y), r2=63(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 94
LDI r2, 63
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
