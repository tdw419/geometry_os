; DESCRIPTION: Composite: . Then Creates a red rectangular region at (18, 127) spanning 48 by 79 pixels. Then Renders a cyan line between points (177, 110) and (54, 23).
; PLAN: r0=18(x), r1=127(y), r2=48(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=177(x1), r1=110(y1), r2=54(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red rectangular region at (18, 127) spanning 48 by 79 pixels.
; PLAN: r0=18(x), r1=127(y), r2=48(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 127
LDI r2, 48
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan line between points (177, 110) and (54, 23).
; PLAN: r0=177(x1), r1=110(y1), r2=54(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 110
LDI r2, 54
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
