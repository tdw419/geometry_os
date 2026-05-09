; DESCRIPTION: Places a magenta 111x116 rectangle at position (357, 86).
; PLAN: r0=357(x), r1=86(y), r2=111(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 86
LDI r2, 111
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
