; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (157, 105) spanning 93 by 44 pixels. Then Places a white line segment connecting (152, 187) to (187, 133).
; PLAN: r0=157(x), r1=105(y), r2=93(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=152(x1), r1=187(y1), r2=187(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange rectangular region at (157, 105) spanning 93 by 44 pixels.
; PLAN: r0=157(x), r1=105(y), r2=93(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 105
LDI r2, 93
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white line segment connecting (152, 187) to (187, 133).
; PLAN: r0=152(x1), r1=187(y1), r2=187(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 187
LDI r2, 187
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
