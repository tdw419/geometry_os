; DESCRIPTION: Composite: . Then Renders a cyan box of size 52x50 starting at (101, 1). Then Draws a orange line from (143, 116) to (165, 251).
; PLAN: r0=101(x), r1=1(y), r2=52(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=143(x1), r1=116(y1), r2=165(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan box of size 52x50 starting at (101, 1).
; PLAN: r0=101(x), r1=1(y), r2=52(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 1
LDI r2, 52
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange line from (143, 116) to (165, 251).
; PLAN: r0=143(x1), r1=116(y1), r2=165(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 116
LDI r2, 165
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
