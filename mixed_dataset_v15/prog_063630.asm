; DESCRIPTION: Places a purple 51x32 rectangle at position (404, 187).
; PLAN: r0=404(x), r1=187(y), r2=51(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 187
LDI r2, 51
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
