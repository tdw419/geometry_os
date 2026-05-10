; DESCRIPTION: Places a blue 117x111 rectangle at position (373, 20).
; PLAN: r0=373(x), r1=20(y), r2=117(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 20
LDI r2, 117
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
