; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (68, 46) spanning 68 by 97 pixels. Then Places a red line segment connecting (131, 131) to (5, 82).
; PLAN: r0=68(x), r1=46(y), r2=68(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=131(x1), r1=131(y1), r2=5(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan rectangular region at (68, 46) spanning 68 by 97 pixels.
; PLAN: r0=68(x), r1=46(y), r2=68(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 46
LDI r2, 68
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red line segment connecting (131, 131) to (5, 82).
; PLAN: r0=131(x1), r1=131(y1), r2=5(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 131
LDI r2, 5
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
