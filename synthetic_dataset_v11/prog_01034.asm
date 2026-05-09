; DESCRIPTION: Composite: . Then Places a magenta circle of radius 31 at center (131, 31). Then Creates a cyan rectangular region at (38, 104) spanning 107 by 25 pixels.
; PLAN: r0=131(x), r1=31(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=38(x), r1=104(y), r2=107(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 31 at center (131, 31).
; PLAN: r0=131(x), r1=31(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 31
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a cyan rectangular region at (38, 104) spanning 107 by 25 pixels.
; PLAN: r0=38(x), r1=104(y), r2=107(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 104
LDI r2, 107
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
