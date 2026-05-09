; DESCRIPTION: Composite: . Then Creates a black rectangular region at (65, 192) spanning 94 by 52 pixels. Then Places a white dot at position (0, 25).
; PLAN: r0=65(x), r1=192(y), r2=94(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=0(x), r1=25(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black rectangular region at (65, 192) spanning 94 by 52 pixels.
; PLAN: r0=65(x), r1=192(y), r2=94(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 192
LDI r2, 94
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (0, 25).
; PLAN: r0=0(x), r1=25(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 0
LDI r1, 25
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
