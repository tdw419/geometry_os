; DESCRIPTION: Places a black 72x57 rectangle at position (404, 155).
; PLAN: r0=404(x), r1=155(y), r2=72(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 155
LDI r2, 72
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
