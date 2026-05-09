; DESCRIPTION: Places a orange 112x70 rectangle at position (374, 116).
; PLAN: r0=374(x), r1=116(y), r2=112(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 116
LDI r2, 112
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
