; DESCRIPTION: Composite: . Then Places a white 33x84 rectangle at position (127, 57). Then Places a red circle of radius 25 at center (226, 54).
; PLAN: r0=127(x), r1=57(y), r2=33(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=226(x), r1=54(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white 33x84 rectangle at position (127, 57).
; PLAN: r0=127(x), r1=57(y), r2=33(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 57
LDI r2, 33
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 25 at center (226, 54).
; PLAN: r0=226(x), r1=54(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 54
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
