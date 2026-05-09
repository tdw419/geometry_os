; DESCRIPTION: Composite: . Then Draws a red circle centered at (187, 96) with radius 38. Then Places a purple 103x32 rectangle at position (34, 223).
; PLAN: r0=187(x), r1=96(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=34(x), r1=223(y), r2=103(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (187, 96) with radius 38.
; PLAN: r0=187(x), r1=96(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 96
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple 103x32 rectangle at position (34, 223).
; PLAN: r0=34(x), r1=223(y), r2=103(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 223
LDI r2, 103
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
