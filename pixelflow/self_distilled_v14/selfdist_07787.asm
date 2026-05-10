; DESCRIPTION: Creates a red filled rectangle of size 38x21 starting at (267, 149).
; PLAN: r0=267(x), r1=149(y), r2=38(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 149
LDI r2, 38
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
