; DESCRIPTION: Composite: . Then Draws a cyan line from (210, 183) to (63, 44). Then Renders a magenta box of size 40x11 starting at (14, 192).
; PLAN: r0=210(x1), r1=183(y1), r2=63(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=14(x), r1=192(y), r2=40(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (210, 183) to (63, 44).
; PLAN: r0=210(x1), r1=183(y1), r2=63(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 183
LDI r2, 63
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta box of size 40x11 starting at (14, 192).
; PLAN: r0=14(x), r1=192(y), r2=40(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 192
LDI r2, 40
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
