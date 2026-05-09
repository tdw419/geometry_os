; DESCRIPTION: Composite: . Then Places a red line segment connecting (13, 83) to (168, 10). Then Creates a orange rectangular region at (50, 76) spanning 54 by 39 pixels.
; PLAN: r0=13(x1), r1=83(y1), r2=168(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=50(x), r1=76(y), r2=54(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red line segment connecting (13, 83) to (168, 10).
; PLAN: r0=13(x1), r1=83(y1), r2=168(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 83
LDI r2, 168
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange rectangular region at (50, 76) spanning 54 by 39 pixels.
; PLAN: r0=50(x), r1=76(y), r2=54(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 76
LDI r2, 54
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
