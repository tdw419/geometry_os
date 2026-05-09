; DESCRIPTION: Composite: . Then Places a green 120x58 rectangle at position (128, 7). Then Draws a white circle centered at (162, 187) with radius 39.
; PLAN: r0=128(x), r1=7(y), r2=120(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=162(x), r1=187(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green 120x58 rectangle at position (128, 7).
; PLAN: r0=128(x), r1=7(y), r2=120(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 7
LDI r2, 120
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white circle centered at (162, 187) with radius 39.
; PLAN: r0=162(x), r1=187(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 187
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
