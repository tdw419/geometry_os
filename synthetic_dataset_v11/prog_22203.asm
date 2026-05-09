; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (176, 70) spanning 39 by 102 pixels. Then Places a red line segment connecting (52, 128) to (186, 16).
; PLAN: r0=176(x), r1=70(y), r2=39(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=52(x1), r1=128(y1), r2=186(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange rectangular region at (176, 70) spanning 39 by 102 pixels.
; PLAN: r0=176(x), r1=70(y), r2=39(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 70
LDI r2, 39
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red line segment connecting (52, 128) to (186, 16).
; PLAN: r0=52(x1), r1=128(y1), r2=186(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 128
LDI r2, 186
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
