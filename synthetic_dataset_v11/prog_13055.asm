; DESCRIPTION: Composite: . Then Places a blue line segment connecting (251, 113) to (56, 16). Then Places a cyan 39x65 rectangle at position (151, 75).
; PLAN: r0=251(x1), r1=113(y1), r2=56(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=151(x), r1=75(y), r2=39(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue line segment connecting (251, 113) to (56, 16).
; PLAN: r0=251(x1), r1=113(y1), r2=56(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 113
LDI r2, 56
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan 39x65 rectangle at position (151, 75).
; PLAN: r0=151(x), r1=75(y), r2=39(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 75
LDI r2, 39
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
