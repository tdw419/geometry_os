; DESCRIPTION: Composite: . Then Renders a green line between points (196, 65) and (105, 111). Then Renders a red box of size 117x38 starting at (81, 192).
; PLAN: r0=196(x1), r1=65(y1), r2=105(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=81(x), r1=192(y), r2=117(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green line between points (196, 65) and (105, 111).
; PLAN: r0=196(x1), r1=65(y1), r2=105(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 65
LDI r2, 105
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red box of size 117x38 starting at (81, 192).
; PLAN: r0=81(x), r1=192(y), r2=117(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 192
LDI r2, 117
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
