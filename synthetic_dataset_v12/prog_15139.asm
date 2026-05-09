; DESCRIPTION: Places a purple 34x99 rectangle at position (404, 83).
; PLAN: r0=404(x), r1=83(y), r2=34(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 83
LDI r2, 34
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
