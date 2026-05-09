; DESCRIPTION: Composite: . Then Draws a red line from (149, 231) to (46, 111). Then Creates a green circular shape at (157, 90) with radius 78.
; PLAN: r0=149(x1), r1=231(y1), r2=46(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=157(x), r1=90(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a red line from (149, 231) to (46, 111).
; PLAN: r0=149(x1), r1=231(y1), r2=46(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 231
LDI r2, 46
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (157, 90) with radius 78.
; PLAN: r0=157(x), r1=90(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 90
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
