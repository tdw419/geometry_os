; DESCRIPTION: Composite: . Then Creates a black rectangular region at (197, 25) spanning 28 by 16 pixels. Then Places a white dot at position (54, 43).
; PLAN: r0=197(x), r1=25(y), r2=28(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=54(x), r1=43(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black rectangular region at (197, 25) spanning 28 by 16 pixels.
; PLAN: r0=197(x), r1=25(y), r2=28(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 25
LDI r2, 28
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (54, 43).
; PLAN: r0=54(x), r1=43(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 54
LDI r1, 43
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
