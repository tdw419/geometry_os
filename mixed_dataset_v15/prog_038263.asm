; DESCRIPTION: Creates a magenta filled rectangle of size 36x86 starting at (350, 41).
; PLAN: r0=350(x), r1=41(y), r2=36(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 41
LDI r2, 36
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
