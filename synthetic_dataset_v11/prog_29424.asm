; DESCRIPTION: Composite: . Then Renders a red box of size 34x23 starting at (166, 129). Then Draws a green line from (182, 18) to (196, 111).
; PLAN: r0=166(x), r1=129(y), r2=34(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=182(x1), r1=18(y1), r2=196(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red box of size 34x23 starting at (166, 129).
; PLAN: r0=166(x), r1=129(y), r2=34(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 129
LDI r2, 34
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (182, 18) to (196, 111).
; PLAN: r0=182(x1), r1=18(y1), r2=196(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 18
LDI r2, 196
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
