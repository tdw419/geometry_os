; DESCRIPTION: Composite: . Then Renders a magenta box of size 64x21 starting at (152, 18). Then Draws a cyan line from (100, 75) to (86, 2).
; PLAN: r0=152(x), r1=18(y), r2=64(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=100(x1), r1=75(y1), r2=86(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta box of size 64x21 starting at (152, 18).
; PLAN: r0=152(x), r1=18(y), r2=64(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 18
LDI r2, 64
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan line from (100, 75) to (86, 2).
; PLAN: r0=100(x1), r1=75(y1), r2=86(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 75
LDI r2, 86
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
