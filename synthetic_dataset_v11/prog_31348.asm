; DESCRIPTION: Composite: . Then Renders a cyan line between points (156, 205) and (15, 105). Then Renders a yellow box of size 30x90 starting at (99, 21).
; PLAN: r0=156(x1), r1=205(y1), r2=15(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=99(x), r1=21(y), r2=30(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan line between points (156, 205) and (15, 105).
; PLAN: r0=156(x1), r1=205(y1), r2=15(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 205
LDI r2, 15
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow box of size 30x90 starting at (99, 21).
; PLAN: r0=99(x), r1=21(y), r2=30(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 21
LDI r2, 30
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
