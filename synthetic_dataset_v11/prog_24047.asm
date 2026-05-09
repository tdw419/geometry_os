; DESCRIPTION: Composite: . Then Draws a cyan line from (190, 61) to (231, 11). Then Creates a orange rectangular region at (19, 101) spanning 38 by 75 pixels.
; PLAN: r0=190(x1), r1=61(y1), r2=231(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=19(x), r1=101(y), r2=38(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (190, 61) to (231, 11).
; PLAN: r0=190(x1), r1=61(y1), r2=231(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 61
LDI r2, 231
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange rectangular region at (19, 101) spanning 38 by 75 pixels.
; PLAN: r0=19(x), r1=101(y), r2=38(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 101
LDI r2, 38
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
