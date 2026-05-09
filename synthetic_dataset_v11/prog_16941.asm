; DESCRIPTION: Composite: . Then Renders a cyan line between points (58, 208) and (97, 80). Then Creates a white rectangular region at (161, 79) spanning 32 by 96 pixels.
; PLAN: r0=58(x1), r1=208(y1), r2=97(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=161(x), r1=79(y), r2=32(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan line between points (58, 208) and (97, 80).
; PLAN: r0=58(x1), r1=208(y1), r2=97(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 208
LDI r2, 97
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white rectangular region at (161, 79) spanning 32 by 96 pixels.
; PLAN: r0=161(x), r1=79(y), r2=32(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 79
LDI r2, 32
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
