; DESCRIPTION: Creates a magenta filled rectangle of size 59x99 starting at (340, 38).
; PLAN: r0=340(x), r1=38(y), r2=59(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 38
LDI r2, 59
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
