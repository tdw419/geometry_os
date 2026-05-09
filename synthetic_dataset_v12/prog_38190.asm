; DESCRIPTION: Places a magenta 111x91 rectangle at position (369, 135).
; PLAN: r0=369(x), r1=135(y), r2=111(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 135
LDI r2, 111
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
