; DESCRIPTION: Composite: . Then Renders a magenta line between points (116, 157) and (188, 193). Then Renders a orange box of size 42x84 starting at (213, 149).
; PLAN: r0=116(x1), r1=157(y1), r2=188(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=213(x), r1=149(y), r2=42(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta line between points (116, 157) and (188, 193).
; PLAN: r0=116(x1), r1=157(y1), r2=188(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 157
LDI r2, 188
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange box of size 42x84 starting at (213, 149).
; PLAN: r0=213(x), r1=149(y), r2=42(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 149
LDI r2, 42
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
