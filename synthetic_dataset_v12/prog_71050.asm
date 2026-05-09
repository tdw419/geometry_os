; DESCRIPTION: Places a purple 26x38 rectangle at position (404, 71).
; PLAN: r0=404(x), r1=71(y), r2=26(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 71
LDI r2, 26
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
