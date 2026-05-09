; DESCRIPTION: Composite: . Then Draws a orange line from (180, 190) to (218, 200). Then Places a black 99x108 rectangle at position (125, 59).
; PLAN: r0=180(x1), r1=190(y1), r2=218(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=125(x), r1=59(y), r2=99(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange line from (180, 190) to (218, 200).
; PLAN: r0=180(x1), r1=190(y1), r2=218(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 190
LDI r2, 218
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black 99x108 rectangle at position (125, 59).
; PLAN: r0=125(x), r1=59(y), r2=99(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 59
LDI r2, 99
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
