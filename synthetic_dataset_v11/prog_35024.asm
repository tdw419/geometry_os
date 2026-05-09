; DESCRIPTION: Composite: . Then Places a red 16x57 rectangle at position (167, 152). Then Places a green circle of radius 70 at center (132, 161).
; PLAN: r0=167(x), r1=152(y), r2=16(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=132(x), r1=161(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red 16x57 rectangle at position (167, 152).
; PLAN: r0=167(x), r1=152(y), r2=16(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 152
LDI r2, 16
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 70 at center (132, 161).
; PLAN: r0=132(x), r1=161(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 161
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
