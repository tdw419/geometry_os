; DESCRIPTION: Composite: . Then Draws a orange line from (99, 42) to (240, 134). Then Places a white 77x28 rectangle at position (165, 25).
; PLAN: r0=99(x1), r1=42(y1), r2=240(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=165(x), r1=25(y), r2=77(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange line from (99, 42) to (240, 134).
; PLAN: r0=99(x1), r1=42(y1), r2=240(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 42
LDI r2, 240
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white 77x28 rectangle at position (165, 25).
; PLAN: r0=165(x), r1=25(y), r2=77(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 25
LDI r2, 77
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
