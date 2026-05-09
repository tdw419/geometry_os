; DESCRIPTION: Places a blue 52x53 rectangle at position (404, 120).
; PLAN: r0=404(x), r1=120(y), r2=52(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 120
LDI r2, 52
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
