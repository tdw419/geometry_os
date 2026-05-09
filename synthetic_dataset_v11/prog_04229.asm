; DESCRIPTION: Composite: . Then Places a orange line segment connecting (126, 82) to (180, 4). Then Creates a purple rectangular region at (74, 49) spanning 39 by 81 pixels.
; PLAN: r0=126(x1), r1=82(y1), r2=180(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=74(x), r1=49(y), r2=39(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange line segment connecting (126, 82) to (180, 4).
; PLAN: r0=126(x1), r1=82(y1), r2=180(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 82
LDI r2, 180
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple rectangular region at (74, 49) spanning 39 by 81 pixels.
; PLAN: r0=74(x), r1=49(y), r2=39(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 49
LDI r2, 39
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
