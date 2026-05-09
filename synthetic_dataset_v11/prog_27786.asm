; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (96, 192) with radius 51. Then Places a cyan 79x51 rectangle at position (171, 97).
; PLAN: r0=96(x), r1=192(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=171(x), r1=97(y), r2=79(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan circular shape at (96, 192) with radius 51.
; PLAN: r0=96(x), r1=192(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 192
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan 79x51 rectangle at position (171, 97).
; PLAN: r0=171(x), r1=97(y), r2=79(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 97
LDI r2, 79
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
