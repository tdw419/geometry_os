; DESCRIPTION: Composite: . Then Draws a orange line from (18, 221) to (83, 135). Then Renders a orange box of size 61x64 starting at (7, 172).
; PLAN: r0=18(x1), r1=221(y1), r2=83(x2), r3=135(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=7(x), r1=172(y), r2=61(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange line from (18, 221) to (83, 135).
; PLAN: r0=18(x1), r1=221(y1), r2=83(x2), r3=135(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 221
LDI r2, 83
LDI r3, 135
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange box of size 61x64 starting at (7, 172).
; PLAN: r0=7(x), r1=172(y), r2=61(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 172
LDI r2, 61
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
