; DESCRIPTION: Composite: . Then Places a orange 13x19 rectangle at position (106, 121). Then Places a orange circle of radius 32 at center (81, 34).
; PLAN: r0=106(x), r1=121(y), r2=13(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=81(x), r1=34(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange 13x19 rectangle at position (106, 121).
; PLAN: r0=106(x), r1=121(y), r2=13(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 121
LDI r2, 13
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange circle of radius 32 at center (81, 34).
; PLAN: r0=81(x), r1=34(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 34
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
