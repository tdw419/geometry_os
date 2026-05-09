; DESCRIPTION: Composite: . Then Draws a red line from (10, 50) to (226, 52). Then Places a yellow 60x75 rectangle at position (173, 93).
; PLAN: r0=10(x1), r1=50(y1), r2=226(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=173(x), r1=93(y), r2=60(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red line from (10, 50) to (226, 52).
; PLAN: r0=10(x1), r1=50(y1), r2=226(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 50
LDI r2, 226
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow 60x75 rectangle at position (173, 93).
; PLAN: r0=173(x), r1=93(y), r2=60(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 93
LDI r2, 60
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
