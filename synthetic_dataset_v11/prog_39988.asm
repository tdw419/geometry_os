; DESCRIPTION: Composite: . Then Renders a cyan box of size 18x110 starting at (107, 99). Then Draws a yellow line from (85, 25) to (77, 95).
; PLAN: r0=107(x), r1=99(y), r2=18(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=85(x1), r1=25(y1), r2=77(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan box of size 18x110 starting at (107, 99).
; PLAN: r0=107(x), r1=99(y), r2=18(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 99
LDI r2, 18
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow line from (85, 25) to (77, 95).
; PLAN: r0=85(x1), r1=25(y1), r2=77(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 25
LDI r2, 77
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
