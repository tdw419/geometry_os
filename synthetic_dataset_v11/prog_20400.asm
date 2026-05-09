; DESCRIPTION: Composite: . Then Renders a orange box of size 76x32 starting at (117, 67). Then Draws a purple line from (73, 63) to (231, 102).
; PLAN: r0=117(x), r1=67(y), r2=76(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=73(x1), r1=63(y1), r2=231(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange box of size 76x32 starting at (117, 67).
; PLAN: r0=117(x), r1=67(y), r2=76(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 67
LDI r2, 76
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (73, 63) to (231, 102).
; PLAN: r0=73(x1), r1=63(y1), r2=231(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 63
LDI r2, 231
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
