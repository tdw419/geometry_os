; DESCRIPTION: Places a black 11x12 rectangle at position (404, 240).
; PLAN: r0=404(x), r1=240(y), r2=11(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 240
LDI r2, 11
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
