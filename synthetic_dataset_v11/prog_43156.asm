; DESCRIPTION: Renders a magenta box of size 104x44 starting at (94, 29).
; PLAN: r0=94(x), r1=29(y), r2=104(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 29
LDI r2, 104
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
