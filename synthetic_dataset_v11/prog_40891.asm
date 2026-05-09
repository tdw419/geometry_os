; DESCRIPTION: Composite: . Then Draws a white line from (205, 199) to (238, 116). Then Places a orange 99x108 rectangle at position (5, 146).
; PLAN: r0=205(x1), r1=199(y1), r2=238(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=5(x), r1=146(y), r2=99(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white line from (205, 199) to (238, 116).
; PLAN: r0=205(x1), r1=199(y1), r2=238(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 199
LDI r2, 238
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange 99x108 rectangle at position (5, 146).
; PLAN: r0=5(x), r1=146(y), r2=99(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 146
LDI r2, 99
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
