; DESCRIPTION: Composite: . Then Draws a cyan line from (7, 32) to (108, 12). Then Places a purple 65x85 rectangle at position (62, 171).
; PLAN: r0=7(x1), r1=32(y1), r2=108(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=62(x), r1=171(y), r2=65(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (7, 32) to (108, 12).
; PLAN: r0=7(x1), r1=32(y1), r2=108(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 32
LDI r2, 108
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple 65x85 rectangle at position (62, 171).
; PLAN: r0=62(x), r1=171(y), r2=65(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 171
LDI r2, 65
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
