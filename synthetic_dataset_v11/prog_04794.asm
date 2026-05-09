; DESCRIPTION: Composite: . Then Places a orange 50x30 rectangle at position (128, 80). Then Places a black circle of radius 35 at center (51, 185).
; PLAN: r0=128(x), r1=80(y), r2=50(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=51(x), r1=185(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange 50x30 rectangle at position (128, 80).
; PLAN: r0=128(x), r1=80(y), r2=50(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 80
LDI r2, 50
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black circle of radius 35 at center (51, 185).
; PLAN: r0=51(x), r1=185(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 185
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
