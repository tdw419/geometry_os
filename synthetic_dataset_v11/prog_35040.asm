; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (177, 6) spanning 67 by 91 pixels. Then Draws a cyan line from (90, 91) to (116, 64).
; PLAN: r0=177(x), r1=6(y), r2=67(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=90(x1), r1=91(y1), r2=116(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta rectangular region at (177, 6) spanning 67 by 91 pixels.
; PLAN: r0=177(x), r1=6(y), r2=67(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 6
LDI r2, 67
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan line from (90, 91) to (116, 64).
; PLAN: r0=90(x1), r1=91(y1), r2=116(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 91
LDI r2, 116
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
