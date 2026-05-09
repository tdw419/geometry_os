; DESCRIPTION: Composite: . Then Places a green circle of radius 15 at center (16, 82). Then Places a orange 97x59 rectangle at position (127, 173).
; PLAN: r0=16(x), r1=82(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=127(x), r1=173(y), r2=97(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 15 at center (16, 82).
; PLAN: r0=16(x), r1=82(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 16
LDI r1, 82
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange 97x59 rectangle at position (127, 173).
; PLAN: r0=127(x), r1=173(y), r2=97(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 173
LDI r2, 97
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
