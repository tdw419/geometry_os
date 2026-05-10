; DESCRIPTION: Places a magenta 44x64 box at position (369, 103).
; PLAN: r0=369(x), r1=103(y), r2=44(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 103
LDI r2, 44
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
