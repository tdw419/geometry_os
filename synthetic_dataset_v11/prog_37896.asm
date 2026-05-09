; DESCRIPTION: Composite: . Then Draws a orange line from (25, 183) to (82, 157). Then Places a orange 113x67 rectangle at position (72, 135).
; PLAN: r0=25(x1), r1=183(y1), r2=82(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=72(x), r1=135(y), r2=113(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange line from (25, 183) to (82, 157).
; PLAN: r0=25(x1), r1=183(y1), r2=82(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 183
LDI r2, 82
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange 113x67 rectangle at position (72, 135).
; PLAN: r0=72(x), r1=135(y), r2=113(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 135
LDI r2, 113
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
