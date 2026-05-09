; DESCRIPTION: Places a magenta 20x28 rectangle at position (403, 221).
; PLAN: r0=403(x), r1=221(y), r2=20(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 221
LDI r2, 20
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
