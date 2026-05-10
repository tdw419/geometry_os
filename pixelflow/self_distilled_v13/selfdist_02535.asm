; DESCRIPTION: Creates a blue filled rectangle of size 113x111 starting at (391, 5).
; PLAN: r0=391(x), r1=5(y), r2=113(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 5
LDI r2, 113
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
