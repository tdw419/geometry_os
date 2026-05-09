; DESCRIPTION: Composite: . Then Renders a cyan line between points (221, 240) and (234, 66). Then Creates a orange rectangular region at (150, 68) spanning 58 by 26 pixels.
; PLAN: r0=221(x1), r1=240(y1), r2=234(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=150(x), r1=68(y), r2=58(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan line between points (221, 240) and (234, 66).
; PLAN: r0=221(x1), r1=240(y1), r2=234(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 240
LDI r2, 234
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange rectangular region at (150, 68) spanning 58 by 26 pixels.
; PLAN: r0=150(x), r1=68(y), r2=58(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 68
LDI r2, 58
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
